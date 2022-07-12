# Maintainer: Phel <phel@mail.de>
pkgname=bergamont-marian-git
pkgdesc='Bergamont project (browser.mt) fork of the marian translator with language models used by Mozilla Firefox Translations'
pkgrel=1
pkgver=20220710
url='https://browser.mt'
license=('MIT')

# NOTE: can probably be expanded rather easily, maybe cmake options need to be modified
arch=('x86_64')

# NOTE: statically compiled, so no deps once installed.
depends=()
makedepends=(openblas cblas lapack cmake pandoc)

# NOTE: As we combine two repos, both can update anytime. So let's use date versioning instead
source=(
#	'https://github.com/browsermt/marian-dev'
	'https://github.com/mozilla/firefox-translations-models/archive/refs/tags/0.3.1.tar.gz'
	'marian-decoder.md'
	'openmp.patch'
)
sha256sums=(
#	'SKIP' 
	'1ccec40d879f5bb38d8edbb953bb282cc861a2c3b1dcdc7ce59145e8b5a3c88b'
	'679b7512f712f054ffd74eda44fe679b8082385ad5525d19a065d6b255e8dd0e'
	'571c8e8efeb873e8415ad32dbcf330c96aa19b110e86767a24dfcc4b30dd9159'
)

prepare(){
	cd "${srcdir}/"
	
	# NOTE: This only works if not already existing.	
	# comment out if source commented in.
	git clone --depth 1 https://github.com/browsermt/marian-dev
	cd marian-dev
	git submodule update --init --depth 1
	git apply ../openmp.patch
	cd ..
}

pkgver(){
	date +%Y%m%d
}

build(){
	cd "${srcdir}/marian-dev"
	
	mkdir --parents build
	cd build
	# NOTE: This step will initialize all submodules.
	cmake ../ -DUSE_OPENMP=on -DUSE_MKL=off -DCOMPILE_CUDA=off -DCOMPILE_CPU=on -DCMAKE_BUILD_TYPE=Release
	# NOTE: Removes any -Werror so the code really compiles
	find . -name "flags.make" -print0 | xargs -0 sed -i s/-Werror//
	# Intels MKL apparently provides lapack routines
	sed -i 's|$|/usr/lib/liblapack.so |' ./src/CMakeFiles/marian_decoder.dir/link.txt
	
	NUM_CPUS=`nproc`
	make -j$NUM_CPUS marian_decoder
	
	# Generate man page
	cd "${srcdir}"
	pandoc -s -t man -o marian-decoder.1 marian-decoder.md
}

package() {
	mkdir --parents "${pkgdir}/usr/share/licenses/${pkgname}/"

	cd "${srcdir}/marian-dev/build"
	install -D -t "${pkgdir}/usr/bin/" marian-decoder
	cp ../LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/marian_license.md"
	
	# ATTENTION: Change here on version bumps
	cd "${srcdir}/firefox-translations-models-0.3.1/models/prod"
	gunzip -r .
	mkdir --parents "${pkgdir}/usr/share/firefox-translations-models/prod"
	cp -r . "${pkgdir}/usr/share/firefox-translations-models/prod"
	cp ../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/firefox_translations_models_license.txt"

	cd "${srcdir}"
	install -D -m644 -t "${pkgdir}/usr/share/man/man1/" marian-decoder.1
}	
