# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
pkgname=libcec-daemon-git
pkgver=r72.fe9df5d
pkgrel=1
pkgdesc="Using your TV to control your PC! Connects libcec to uinput."
arch=('x86_64' 'aarch64')
url="https://github.com/bramp/libcec-daemon"
license=('custom:BSD-2-Clause')
depends=('glibc' 'gcc-libs' 'libcec' 'boost-libs' 'log4cplus')
makedepends=('git' 'boost')
backup=('etc/default/libcec-daemon')
source=("${pkgname}::git+${url}.git#branch=master"
        "libcec-daemon.service"
        "libcec-daemon.conf"
        "pr32.patch::https://patch-diff.githubusercontent.com/raw/bramp/libcec-daemon/pull/32.patch")
sha256sums=('SKIP'
            '7e49ad4b73cb37915c756a79f237f51190b7a6ae795a29b9adff3268a138854d'
            '358e689c646d65da99214cbf40cec931733cbeef50e272b5cb363302a9bed138'
            '64320c5d1744b1dfaf21bb8cd32cc8f0fc97d83cd44e1a08eb76254bfa4d2850')
b2sums=('SKIP'
        'de47cb2c3c56dfbd23eccefc9c21fe6f81982ae52f4567dcdab2ca3a036dc002452a8b516bf0522f2be14b5cda65b318de66cc4c730e69e6960eff066e3d0626'
        '6092f70b270e206bef10d82fe6cbe9303170a5bb886ab2404175f7730628e8d08457e46d60091332d4dc85a9b991c22f75aeea209f68b70d8ab5a4c2840c26f1'
        '9a558a54d35e56cb009cf5059217e4ac6e783c81c299ad0d6b2eb857796342b2ec2604a6e8beb6dd6a2cb819911a2c2761af965992758bb9f725355a8ecc64af')

prepare() {
  cd "${pkgname}"
  patch --forward --strip=1 --input="${srcdir}/pr32.patch"
}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
  aclocal -I m4
  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 "${srcdir}/libcec-daemon.service" "${pkgdir}/usr/lib/systemd/system/libcec-daemon.service"
  install -Dm644 "${srcdir}/libcec-daemon.conf" "${pkgdir}/etc/default/libcec-daemon"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
