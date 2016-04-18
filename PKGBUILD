# Maintainer: Jeffrey Clark (h0tw1r3) <dude@zaplabs.com>

_gitname=attract
_gitbranch=master
pkgname=${_gitname}-git
pkgver=2.0.0.rc3.r21
pkgrel=1
pkgdesc="A graphical front-end for command line emulators that hides the underlying operating system and is intended to be controlled with a joystick or gamepad."
arch=('i686' 'x86_64')
url="http://www.attractmode.org/"
license=('GPL3')
depends=('sfml' 'openal' 'ffmpeg' 'fontconfig' 'libxinerama' 'libarchive')
makedepends=('git')
conflicts=('attract')
provides=('attract')
replaces=('attractmode-git')
install="${_gitname}.install"
source=("${_gitname}::git+https://github.com/mickelson/${_gitname}.git#branch=${_gitbranch}"
	"https://github.com/mickelson/${pkgname%-*}/releases/download/v1.6.2/ATTRACT.MODE.intro.16-9.v6.1080p.mp4"
	"https://github.com/mickelson/${pkgname%-*}/releases/download/v1.6.2/ATTRACT.MODE.intro.4-3.v6.1080p.mp4"
	"${_gitname}.desktop"
	"${install}")
sha1sums=('SKIP'
	'37885c5f2e6194e689c36eb88c43bd5bb23363d0'
	'445bb161b9c06749347974b6c19c846d86b00ceb'
	'cf599edbff2962b5ff0a77560a95d80cec828264'
	'284afdf55086f2a626d5ab617240ff74cea30f53')

pkgver() {
	cd "${_gitname}"
	tag=$(git describe --abbrev=0)
	printf "%s.r%s\n" "$(echo ${tag} | sed 's/^v//;s/-/./g')" "$(git rev-list --count ${tag}..HEAD)"
}

build() {
	cd "${_gitname}"
	make prefix=/usr
}

package() {
	cd "${_gitname}"
	make prefix="${pkgdir}/usr" install
	install -Dm644 License.txt ${pkgdir}/usr/share/licenses/${_gitname}/License.txt
	install -Dm644 ../ATTRACT.MODE.intro.16-9.v6.1080p.mp4 ${pkgdir}/usr/share/attract/intro/intro.mp4
	install -Dm644 ../ATTRACT.MODE.intro.4-3.v6.1080p.mp4 ${pkgdir}/usr/share/attract/intro/intro_4x3.mp4
	install -Dm644 util/icon.png ${pkgdir}/usr/share/pixmaps/attract.png
	install -Dm644 ${srcdir}/attract.desktop ${pkgdir}/usr/share/applications/attract.desktop
}
