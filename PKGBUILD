# Maintainer: Yurii <yu.hrysh@posteo.net>

pkgname=open-hexagon-git
pkgver=2.0.preview.r2012.g439a97c2
pkgrel=1
epoch=1
pkgdesc='Free software clone of Super Hexagon - a music-based arcade game'
url='https://openhexagon.org/'
arch=('any')
license=('custom:AFL-3.0' 'custom')
depends=(
  'luajit' 'imgui-sfml'
  'zenity'  # just so UX is pretty
)
makedepends=('git' 'cmake' 'rsync')
optdepends=('steam: integration for those who own the game on Steam'
'discord: Discord Rich Presence support')
provides=('open-hexagon')
conflicts=('open-hexagon')
source=(
	'git+https://github.com/SuperV1234/SSVOpenHexagon.git'
	'open-hexagon-git-assets.zip::https://github.com/SuperV1234/SSVOpenHexagonAssets/archive/master.zip'
	'open-hexagon-git.install'
	'open-hexagon'
	'open-hexagon.desktop'
	'fix-linking.diff'
)
install="$pkgname.install"
sha512sums=(
	'SKIP'
	e062d52b3d12fba285e881175ec7c834b24e28b366a9a19d8dbdbe7b6ffae9462ab5d0f9f84119276a30f9c7b6f8745b00eb98c3e90e344a740824cec26505e9
	b9b7124b16e3019dc36f3219107b7093ade9d88fa03c249575f2914d063df7f4311a390e78372cb741729db288d7cd74e5fc6e936277e619a1b3ed65f233891a
	d7b40efb198233365f8ad92c14c04150eb064c212c04f77720843cbd0d89c4d80e3b6a513a4a04bcaa9e11f5308ea0a75bac63c8c4b9e269477e01c8a0080530
	bc7d1e1a420a439283b4fcf2f06a8a50ca06d3934b79f6a93ff4ad4d269d6b246eb6a1824381c36bbb73fc7d24e9883281ab66eab05b2cc2fdbac3ed14a775d5
	ed8beeffba0e1c4a31f84f5a503da7f50ba9bdb4a3bd7e3b0dc0e61a62a40511bba887232412cadd0ed02ea0d0424f12ed6b59c75d6bf9472a7d2c89f308c8f8
)
b2sums=(
	'SKIP'
	7dfe5d5b32f35cd9572199bf2080ae4c3552fb5496836a139c90cb5bae7adb46545c0017fcb302409bc1babcc1f5f30a136e232983197c485ae1d65d3d8ce581
	61dee7a9ea98ee85ad2ff98de4297c5fe74442f8b2c6f5108cef320649a92e6053cfc42568d2423e76b5671a2f4cb310e7f0c937e38ec4af8df1c2b9fde53e55
	7aab3f71132d7824eb1569d6c543027df6ea43311291e60a8d873b73a4e1abd34c127f17df47977d0bec8d9d3f8941911fbbf4e97ad0e7ba930a43008a074661
	2ea97df7c917222e6a13b778208e41401c7d29db7851b6252c2a7db3107adad7a3e939e27684352277971c1220f90243a6053580af21c960a041b84375e9a239
	aa51608e4796f8be19cea31135e8e240f8f9de962a7d77bc5dffd7beba5f87193a2f7c1a2df4a13de0fd7861170fc1e8f606b97ef7718e8d1aaf6e4cbfb9a8bc
)

_reponame="SSVOpenHexagon"
_assetsname="SSVOpenHexagonAssets-master"

prepare() {
	cd "${srcdir}/${_reponame}"
	patch -p1 <"${srcdir}/fix-linking.diff"
}

pkgver() {
	# Use the most recent un-annotated tag
	cd "${srcdir}/${_reponame}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_reponame}"
	git submodule init
	git submodule update

	./build.sh

	cd ..
	# Merge directories
	rsync -av --remove-source-files --ignore-existing "${srcdir}/${_assetsname}/_RELEASE" "${srcdir}/${_reponame}"
}

package() {
	mkdir -p "${pkgdir}/usr/lib/"
	mkdir -p "${pkgdir}/var/lib/open-hexagon/Profiles" "${pkgdir}/var/lib/open-hexagon/Replays"

	cd "${srcdir}/${_reponame}/_RELEASE"
	rm -f *.bat *.dll *.lib
	install -Dm644 "Assets/Open Hexagon Assets License.txt" -t "${pkgdir}/usr/share/licenses/open-hexagon/"

	cd "${srcdir}/${_reponame}"
	cp -r "_RELEASE" "${pkgdir}/usr/lib/open-hexagon"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/open-hexagon/"
	
	# Dirty hack to allow writing data to current directory
	# (also see .install file)
	cp "${srcdir}/${_reponame}/misc/default_config.json" "${pkgdir}/var/lib/open-hexagon/default_config.json"
	cp "${srcdir}/${_reponame}/misc/default_config.json" "${pkgdir}/var/lib/open-hexagon/config.json"

	cd "${pkgdir}/usr/lib/open-hexagon"
	ln -s "$(ls -1r /usr/lib/libluajit-*.so | head -n1)" libluajit.so
	for i in config.json default_config.json scores.json users.json log.txt Profiles Replays; do
		ln -sf "../../../var/lib/open-hexagon/${i}"
	done

	# Executables
	install -Dm755 "${srcdir}/open-hexagon" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/open-hexagon.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${_reponame}/art/icon.png" "${pkgdir}/usr/share/pixmaps/open-hexagon.png"
}
