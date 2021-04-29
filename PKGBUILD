# Maintainer: ml <>
pkgname=google-chat-linux
_pkgver='5.12.11-2'
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Unofficial electron-based desktop client for Google Chat, electron not included'
arch=('any')
url='https://github.com/squalou/google-chat-linux'
license=('custom:UNKNOWN')
depends=('electron')
makedepends=('jq' 'npm' 'nodejs-lts-fermium')
source=("${url}/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
  google-chat-linux.sh
  google-chat-linux.desktop
  sandbox.patch)
sha256sums=('c80772d4c3403d4b4a329058f9c9e9874948a3e0277c7358e40580337361dda6'
            '5a458e5d7193784383ceda44faf8852410296f310acb5495d53c16bd0ea50059'
            'c7fdfa74422ce7900563fd1a0f5d76c4d4cd6d153ca3b28ab5a8912a33cba9c7'
            'e4b63ca04f05b03de70fd7440981646ae7eb778fa749fd8ac26dd545833b0a43')


_patch_package_json() {
  mv package.json package.json.orig
  jq --arg version "$(</usr/lib/electron/version)" -f /dev/stdin package.json.orig <<'EOF' >package.json
del(.devDependencies.electron) |
.build *= {
  "electronDist": "/usr/lib/electron",
  "electronVersion": $version,
  "files": [
    "assets",
    "src"
  ]
}
EOF
}

_npm() { npm --no-audit --no-fund --no-update-notifier --cache="$srcdir/npm-cache" "$@"; }
prepare() {
  cd "$pkgname-$_pkgver"
  patch -Np1 < ../sandbox.patch
  _patch_package_json
  _npm install
}

build() {
  cd "$pkgname-$_pkgver"
  export NODE_ENV=production
  _npm run-script pack
}

package() {
  install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 "$pkgname".desktop -t "${pkgdir}/usr/share/applications"

  cd "$pkgname-$_pkgver"
  install -Dm644 dist/linux-unpacked/resources/app.asar "$pkgdir"/usr/lib/"$pkgname".asar

  for i in build/icons/*.png; do
    : "${i##*/}"
    install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${_%.png}x${_%.png}/apps/$pkgname.png"
  done
  #install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
