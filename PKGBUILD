# Maintainer: Lukas Sabota <lukas _at_ lwsabota _dot_ com>
# Contributer: Lukas Sabota <lukas _at_ lwsabota _dot_ com>
pkgname=sn76489-vst-git
_gitbase=SN76489
pkgver=r21.831508e
pkgrel=1
pkgdesc="Emulates Texas Instruments SN76489 audio chip found in Sega Master System as a VST plugin"
arch=('i686' 'x86_64')
url="http://socalabs.com/"
license=('LGPL')
groups=('socalabs-vst-suite')
depends=('mesa' 'webkit2gtk')
makedepends=('git')
source=('SN76489::git+https://github.com/FigBug/SN76489.git'
		'dRowAudio::git+https://github.com/FigBug/drowaudio.git#commit=3a1e6eb75681b166c055c501a2ed4a8df8a44df0'
		'slCommon::git+https://github.com/FigBug/slCommon.git#commit=b49d31c4f2f131506fe5ac53f2ac6e47b3ee109b'
		'JUCE::git+https://github.com/WeAreROLI/JUCE.git#branch=develop')
# Note: This package requires features in the develop branch of JUCE
# This package can likely be moved to depend on the juce AUR package
# after an upstream JUCE release.
# FYI: This can be accomplished by symlinking /opt/JUCE to $srcdir/JUCE
# in the future.
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitbase"
	# Workaround for SSH-only configured submodule remotes
	cd modules
	rm -rf dRowAudio slCommon
	ln -s ../../dRowAudio ./
	ln -s ../../slCommon ./
}

build() {
	cd "$srcdir/$_gitbase/plugin/Builds/LinuxMakefile"
	make
}

package() {
	install -D -m644 "$srcdir/$_gitbase/plugin/Builds/LinuxMakefile/build/$_gitbase.so" "$pkgdir/usr/lib/vst/$_gitbase.so"
}
