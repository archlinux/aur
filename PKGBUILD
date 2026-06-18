# Maintainer: kekmacska <kekmacska2@proton.me>
# Maintainer: sakure <duarm at disroot dot org>
# Old Maintainer: nixi <nixi at cock dot li>
# Contributor: <darkfeline@felesatra.moe>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=sqlitebrowser-git
pkgver=continuous.r0.g9cee4e5d
pkgrel=1
pkgdesc="DB Browser for SQLite"
arch=('i686' 'x86_64')
url="http://sqlitebrowser.org/"
license=('GPL3')
provides=('sqlitebrowser')
conflicts=('sqlitebrowser')
depends=('qt6-base' 'sqlite' 'libxkbcommon-x11')
makedepends=('cmake' 'qt6-tools' 'git')
install=sqlitebrowser.install
source=($pkgname'::git+https://github.com/sqlitebrowser/sqlitebrowser.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^non-daw-v//;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"

    CFLAGS="-O3 -march=native -mtune=native \
        -funroll-loops \
        -falign-functions=32 -falign-loops=32 \
        -fno-semantic-interposition \
        -fno-math-errno -fno-trapping-math \
        -fomit-frame-pointer -fno-plt \
        -Wall -pipe -flto=auto"

	CXXFLAGS="-O3 -march=native -mtune=native \
			-funroll-loops \
			-falign-functions=32 -falign-loops=32 \
			-fno-semantic-interposition \
			-fno-math-errno -fno-trapping-math \
			-fomit-frame-pointer -fno-plt \
			-Wall -pipe -flto=auto"

	LDFLAGS="-fno-plt -flto=auto"

    cmake \
        -DQT_MAJOR=Qt6 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_FLAGS="$CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
        -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
        .

    make
}

package() {
	cd $srcdir/$pkgname
	make install DESTDIR=$pkgdir
	install -Dm0644 distri/sqlitebrowser.desktop $pkgdir/usr/share/applications/sqlitebrowser.desktop
	install -dm0755 $pkgdir/usr/share/icons/
	install -m0644 images/logo.svg $pkgdir/usr/share/icons/
}
