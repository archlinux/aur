# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor-bin
_pkgname=ani2xcursor
pkgver=1.4.9
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')
depends=(
  'glibc'
  'fuse2'
)
options=('!strip' '!debug')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-v${pkgver}-linux-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.AppImage")
sha256sums_x86_64=('fed65fd7be0800ddd9ce326316f08945cc000d417dee40c633943b4e81bc3841')
source_aarch64=("${_pkgname}-v${pkgver}-linux-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-aarch64.AppImage")
sha256sums_aarch64=('65560a04063962d743fe14d08b43b415427e6ef97bce1700afea1ef0151d6f8e')

prepare() {
  cd "$srcdir"
  local appimage="${_pkgname}-v${pkgver}-linux-${CARCH}.AppImage"

  chmod +x "$appimage"
  "./$appimage" --appimage-extract usr/share >/dev/null
}

package() {
  cd "$srcdir"
  local appimage="${_pkgname}-v${pkgver}-linux-${CARCH}.AppImage"

  install -Dm755 "$appimage" \
    "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ani2xcursor" <<'EOF'
#!/bin/sh
exec /opt/ani2xcursor/ani2xcursor.AppImage "$@"
EOF

  cd "$srcdir/squashfs-root/usr"

  install -Dm644 share/licenses/ani2xcursor/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 share/doc/ani2xcursor/README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 share/fish/vendor_completions.d/ani2xcursor.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/ani2xcursor.fish"

  install -Dm644 share/bash-completion/completions/ani2xcursor \
    "$pkgdir/usr/share/bash-completion/completions/ani2xcursor"

  install -Dm644 share/zsh/site-functions/_ani2xcursor \
    "$pkgdir/usr/share/zsh/site-functions/_ani2xcursor"

  for mo in share/locale/*/LC_MESSAGES/ani2xcursor.mo; do
    lang=$(echo "$mo" | cut -d/ -f3)
    install -Dm644 "$mo" \
      "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/ani2xcursor.mo"
  done
}
