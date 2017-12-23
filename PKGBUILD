# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgbase="sddm"
pkgname="$_pkgbase-git"
pkgver=0.17.0.0.ga15888b
pkgrel=3
pkgdesc="The Simple Desktop Display Manager"
arch=("x86_64")
url="https://github.com/sddm/sddm"
license=("GPL")
depends=('qt5-declarative' 'xorg-xauth' 'xorg-server')
makedepends=('extra-cmake-modules' 'python-docutils' 'qt5-tools' 'git')
provides=("$_pkgbase" 'display-manager')
conflicts=("$_pkgbase")
backup=('usr/share/sddm/scripts/Xsetup'
        'etc/pam.d/sddm')
source=("git://github.com/sddm/sddm.git#branch=master"
sddm.sysusers sddm.tmpfiles)
sha256sums=('SKIP'
            '9fce66f325d170c61caed57816f4bc72e9591df083e89da114a3bb16b0a0e60f'
            'db625f2a3649d6d203e1e1b187a054d5c6263cadf7edd824774d8ace52219677')


pkgver() {
	cd "$srcdir/$_pkgbase"
	#_ver="$(cat CMakeLists.txt | grep -m3 -e _VERSION_MAJOR -e _VERSION_MINOR -e _VERSION_PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
        #echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
	git describe --long | sed 's/^v//;s/-/./g'
}

prepare() {
        mkdir -p build
}

build() {
        cd build
	cmake "$srcdir/$_pkgbase" \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
            -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
            -DBUILD_MAN_PAGES=ON
        make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir"/sddm.sysusers "$pkgdir"/usr/lib/sysusers.d/sddm.conf
  install -Dm644 "$srcdir"/sddm.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/sddm.conf

  # Move sddm.conf to /usr/lib https://bugs.archlinux.org/task/56609
  mkdir "$pkgdir"/usr/lib/sddm/sddm.conf.d
  mv "$pkgdir"/{etc/sddm.conf,usr/lib/sddm/sddm.conf.d}

  # Don't set PATH in sddm.conf
  sed -r 's|DefaultPath=.*|DefaultPath=/usr/local/sbin:/usr/local/bin:/usr/bin|g' -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/sddm.conf
}
