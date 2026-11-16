# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgbase=kiri-bin
pkgname=('kiri-bin' 'kiri-lite-bin')
pkgver=0.2.1
pkgrel=1
pkgdesc="Tiny, fast container runtime speaking the Docker API"
arch=('x86_64' 'aarch64')
url="https://runkiri.com"
_gh="https://github.com/libracoder/kiri"
license=('Apache-2.0')
options=('!strip' '!debug')
source=('kiri.sysusers' 'kiri-path.sh' 'kiri.install')
source_x86_64=(
  "kiri-${pkgver}-x86_64.rpm::${_gh}/releases/download/v${pkgver}/kiri-${pkgver}-1.x86_64.rpm"
  "kiri-lite-${pkgver}-x86_64.deb::${_gh}/releases/download/v${pkgver}/kiri-lite_${pkgver}_amd64.deb"
)
source_aarch64=(
  "kiri-${pkgver}-aarch64.rpm::${_gh}/releases/download/v${pkgver}/kiri-${pkgver}-1.aarch64.rpm"
  "kiri-lite-${pkgver}-aarch64.deb::${_gh}/releases/download/v${pkgver}/kiri-lite_${pkgver}_arm64.deb"
)
noextract=("kiri-${pkgver}-"{x86_64,aarch64}.rpm "kiri-lite-${pkgver}-"{x86_64,aarch64}.deb)
sha256sums=('b51af0fe564133bb9c44003954b7179ef29f30a4118712485a54c0db5e43512d'
            '644847bf7123f538aab0e2dad11b491f18905c6237a4e46048d816e2b74d4df9'
            'cc85676414f87b4c07af61e8df1a298fd3cc82fed4ec7024dec250fc629ced47')
sha256sums_x86_64=('dcd3c6df3b2b198f3a85d8e757864c2c33ae16e29646cec102e471eb7d3a4821'
                   '5e7b1f6d8239aa590b314fd2ccc8f1472ba1427f414b35efa86ccedd6a6571b2')
sha256sums_aarch64=('55f52eb2d7d935063b0f6f7ac53b66d3a423c9e250820941a0074ac4c42dc788'
                    '76fe00facf4d61aefe90fbb0e44774942b1507e810c4e7b47ea34fddafe0193d')

_fixup() {
  install -Dm644 "$srcdir/kiri.sysusers" "$pkgdir/usr/lib/sysusers.d/kiri.conf"

  find "$pkgdir" -type d -exec chmod 755 {} +
}

_unpack_deb() {
  local _deb=$1 _tmp
  _tmp=$(mktemp -d "$srcdir/deb.XXXXXX")
  bsdtar -xf "$_deb" -C "$_tmp"
  bsdtar -xpf "$_tmp"/data.tar.* -C "$pkgdir"
  rm -rf "$_tmp"

  install -dm755 "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/lib/systemd/system/kiri.service" "$pkgdir/usr/lib/systemd/system/"
  rm -rf "$pkgdir/lib"

  _fixup
}

_unpack_rpm() {
  bsdtar -xpf "$1" -C "$pkgdir"

  rm -rf "$pkgdir/usr/lib/.build-id"

  _fixup
}

package_kiri-bin() {
  pkgdesc+=" (bundled docker CLI, Compose, buildx; GUI on x86_64)"
  depends=('glibc' 'polkit')
  depends_x86_64=('gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk3' 'webkit2gtk-4.1')
  optdepends=(
    'docker: system docker CLI (preferred over the bundled one when installed)'
    'docker-compose: system Compose plugin (preferred over the bundled one)'
    'docker-buildx: system buildx plugin (preferred over the bundled one)'
  )
  conflicts=('kiri-lite-bin' 'kiri-git')
  install=kiri.install

  _unpack_rpm "kiri-${pkgver}-${CARCH}.rpm"

  mv "$pkgdir/usr/share/licenses/kiri" "$pkgdir/usr/share/licenses/$pkgname"

  install -dm755 "$pkgdir/usr/lib/kiri"
  mv "$pkgdir/usr/libexec/kiri/bin" "$pkgdir/usr/lib/kiri/bin"
  mv "$pkgdir/usr/libexec/kiri/docker" "$pkgdir/usr/lib/kiri/docker"
  sed -i 's|/usr/libexec/kiri/bin/docker|/usr/lib/kiri/bin/docker|' "$pkgdir/usr/lib/kiri/docker"

  install -dm755 "$pkgdir/usr/libexec/docker"
  mv "$pkgdir/usr/libexec/kiri/cli-plugins" "$pkgdir/usr/libexec/docker/cli-plugins"
  rmdir "$pkgdir/usr/libexec/kiri"

  install -dm755 "$pkgdir/usr/lib/kiri/path"
  ln -s /usr/lib/kiri/docker "$pkgdir/usr/lib/kiri/path/docker"
  install -Dm644 "$srcdir/kiri-path.sh" "$pkgdir/etc/profile.d/kiri.sh"
}

package_kiri-lite-bin() {
  pkgdesc+=" (engine only)"
  depends=('glibc')
  optdepends=(
    'docker: docker CLI to talk to the engine'
    'polkit: pkexec for kiri host-access'
  )
  conflicts=('kiri-bin' 'kiri-git')
  install=kiri.install

  _unpack_deb "kiri-lite-${pkgver}-${CARCH}.deb"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/kiri-lite/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/share/doc/kiri-lite/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
