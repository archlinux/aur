# Maintainer: Nick G. <wirlaburla@worlio.com>

_pkgbase=psi-plus
_plugin=mediaplugin
pkgname=${_pkgbase}-${_plugin}-git
pkgver=1.0.5.175.g478567e
pkgrel=1
pkgdesc="Psi+ Audio/video RTP"
arch=('x86_64')
url="https://github.com/psi-im/psimedia"
license=('LGPL2')
depends=('psi-plus-git')
makedepends=('git' 'cmake')
conflicts=('psi-plus-mediaplugin')
provides=("psi-plus-mediaplugin=$pkgver")
source=('git+https://github.com/psi-im/psimedia'
        'git+https://github.com/psi-im/psi.git'
        "${_pkgbase}::git+https://github.com/psi-plus/main.git"
        'git+https://github.com/psi-im/libpsi.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd psimedia
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd psi
  
  # makepkg doesn't support --recursive
  # so setup git modules manually
  git submodule init
  git config submodule.src/libpsi.url "$srcdir/libpsi"
  # git submodule update
  # From git 2.38.1-1, "git submodule" in PKGBUILD does not work
  # unless we change the git config "protocol.file.allow" [1,2].
  # [1] https://bugs.archlinux.org/task/76255
  # [2] https://bbs.archlinux.org/viewtopic.php?pid=2063104#p2063104
  git -c protocol.file.allow=always submodule update --init --recursive
}
    
build() {
	cd psimedia
	cmake \
		-B build \
		-S psimedia \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DUSE_PSI=OFF \
		-DBUILD_DEMO=OFF \
		.
	cmake --build build
}

package() {
	cd psimedia
	DESTDIR="$pkgdir" cmake --install build
}

