# Maintainer: kpcyrd <git@rxv.cc>

_gitname=sniffglue
pkgname=sniffglue-git
pkgver=0.8.3.r0.g1e5ecae
pkgrel=1
pkgdesc="Secure multithreaded packet sniffer"
url="https://github.com/kpcyrd/sniffglue"
depends=('libpcap' 'libseccomp')
makedepends=('cargo' 'git')
provides=('sniffglue')
conflicts=('sniffglue')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
backup=('etc/sniffglue.conf')
source=("git+https://github.com/kpcyrd/${_gitname}.git"
        "sniffglue-sysuser.conf"
        "sniffglue.conf")
sha256sums=('SKIP'
            '531e051488e57ed2f5bf5d8289fa5562aa0ca73783838c11ec13c043dc268d02'
            'a2e6cfa918a4e354b5c4c4c84867f3bb142833fde4acab545e13c8e89864004c')
sha512sums=('SKIP'
            '2595eb4856bc7a59c078255bf2aeeaa44a4f6a69b37cc8982e5d70a8ef14cb29b83b4d191ab3baabfbcf209f3effd232c10ec5baabc6ce52990969526d6fda98'
            '66e6b87e832ba8424334d24e3457a214e60e67c731471098329d0ca54c574518f7856ba780bb6bffde53bdefe2c8f789a242138ae67e2fef3e562fa083b362b1')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  cargo build --release --locked
}

check() {
  cd "${_gitname}"
  cargo test --release --locked
}

package() {
  cd "${_gitname}"
  install -Dm755 "target/release/$_gitname" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/sniffglue-sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/sniffglue.conf"
  install -Dm644 "${srcdir}/sniffglue.conf" -t "${pkgdir}/etc"
  install -Dm644 docs/sniffglue.1 -t "${pkgdir}/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
