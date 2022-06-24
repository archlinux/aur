# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lxc-git
_pkgname=lxc
pkgver=lxc.5.0.0.6
pkgrel=1
pkgdesc="Linux Containers git version"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://linuxcontainers.org"
depends=('bash' 'perl' 'libseccomp' 'libcap' 'python' 'rsync' 'wget')
makedepends=('docbook2x' 'systemd' 'meson' 'lua' 'python-setuptools' 'apparmor' 'git')
optdepends=('dnsmasq: lxc-net.service'
  'lua'
  'lua-filesystem: lxc-top'
  'lua-alt-getopt: lxc-top')
license=('LGPL')
options=('emptydirs' 'debug')
backup=('etc/lxc/default.conf'
  'etc/default/lxc')
provides=($_pkgname)
conflicts=($_pkgname lxc-git)

source=(
  git+https://github.com/lxc/lxc
  lxc.tmpfiles.d
  lxc.service
  lxc-auto.service)
sha256sums=('SKIP'
            '10e4f661872f773bf3122a2f9f2cb13344fea86a4ab72beecb4213be4325c479'
            'bbe7e0447bc3bf5f75f312c34d647f5218024731628a5e8633b1ea1801ebe16b'
            'b31f8d6b301ab9901b43f2696bcd0babb32b96e4a59fab63a2d642e43bf26bb3')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i "s|if sanitize == 'none'|if false|g" src/lxc/cmd/meson.build
}

build() {
  cd "$_pkgname"
  arch-meson build
  meson compile -C build -v
}

package() {
  cd "$_pkgname"

  meson install -C build --destdir "$pkgdir"

  install -d -m755 "$pkgdir/var/lib/lxc"
  install -d -m755 "$pkgdir/usr/lib/lxc/rootfs/dev"
  install -D -m644 "$srcdir"/lxc.service "$pkgdir"/usr/lib/systemd/system/lxc@.service
  install -D -m644 "$srcdir"/lxc-auto.service "$pkgdir"/usr/lib/systemd/system/lxc-auto.service
  install -D -m644 "$srcdir"/lxc.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/lxc.conf

  cd doc
  find . -type f -name '*.1' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man1/{}" \;
  find . -type f -name '*.5' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man5/{}" \;
  find . -type f -name '*.7' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man7/{}" \;
}
