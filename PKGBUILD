# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: Tim Diels <timdiels.m@gmail.com>

pkgname=electroneum-git
pkgver=0.11.0.0.r12.g31af2ce5
pkgrel=5
pkgdesc='Secure, private, mobile based cryptocurrency, git version'
arch=('any')
url='https://electroneum.com'
license=('custom')
makedepends=('cmake' 'git')
depends=('boost' 'openssl' 'unbound')
#checkdepends=('gtest')
optdepends=(
  'miniupnpc: NAT punching'
  'libunwind: stack traces'
  'ldns: SSL toolkit'
  'expat: XML parsing'
  'doxygen: documentation'
  'graphviz: documentation'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=$pkgver")
source=("electroneum"::"git+https://github.com/electroneum/electroneum.git"
        electroneumd.service
        0001-archlinux-openssl-1.0.patch)
md5sums=('SKIP'
         '614c615d7218e4745bb6016644e71156'
         'ae1bcb862a92f9996a08a0025d828e0f')
#options=('!strip')
backup=('etc/electroneumd.conf')
install=electroneum.install

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  # compile against openssl-1.0 
  patch -Np1 -i ../0001-archlinux-openssl-1.0.patch
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  # Note: plain make fails with undeclared DIFFICULTY_TARGET_V1
  # make release-static fails when compiling with e.g. -j8
  make -j1 release-static
}

# Tests always fail due to DIFFICULT_TARGET_V1 error, so we don't run them
#check() {
#    cd "$pkgname-$pkgver"
#    #make release-test
#}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Note: make has no install target. Static build means we don't need to
  # install lib.
  install -dm755 "$pkgdir/usr/bin/"
  install -Dm755 build/release/bin/* "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  # install conf file
  install -Dm644 utils/conf/electroneumd.conf "${pkgdir}/etc/electroneumd.conf"

  # using a modified service unit file to use another pid file path
  install -Dm644 "$srcdir/electroneumd.service" "${pkgdir}/usr/lib/systemd/system/electroneumd.service"
}

