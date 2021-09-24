# Maintainer: Pedro Gameiro <pm underscore gameiro undercore act at posteo dot pt>
pkgname=bloomrpc
pkgver=1.5.3
pkgrel=2
pkgdesc="GUI Client for gRPC Services"
arch=(any)
url="https://github.com/uw-labs/bloomrpc"
license=(LGPL3)
depends=('gtk3' 'python2' 'libxss' 'libxtst')
makedepends=('nodejs' 'npm'  'clang' 'git' 'yarn')
source=("${pkgname}::git+https://github.com/uw-labs/bloomrpc.git#tag=${pkgver//_/-}"
        "${pkgname}.desktop")
sha1sums=('SKIP'
          '165cba3a4717d7903c76d73c21db4dc276e0e298')

prepare() {
  cd "${pkgname}"
  sed -i '/_where/d' package.json

  # Fix infinite build loop
  git apply << 'EOF'
diff --git a/app/package.json b/app/package.json
index abe8e47..30e6682 100644
--- a/app/package.json
+++ b/app/package.json
@@ -10,8 +10,7 @@
     "url": "https://github.com/fenos"
   },
   "scripts": {
-    "electron-rebuild": "node ../internals/scripts/ElectronRebuild.js",
-    "postinstall": "yarn electron-rebuild --version=7.1.11"
+    "electron-rebuild": "node ../internals/scripts/ElectronRebuild.js"
   },
   "externals": [
     "grpc"
EOF
}

build() {
  cd "${pkgname}"
  export CXX=clang++
  export CC=clang

  yarn
  npm --cache "${srcdir}/npm-cache" run package-linux
}

package() {
  cd "${pkgname}"

  install -dm755 "${pkgdir}/opt/BloomRPC"
  cp -rd release/linux-unpacked/* "${pkgdir}/opt/BloomRPC/"

  cd resources/icons/
  for f in *.png; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${f%.png}/apps/"
    install -Dm644 $f "${pkgdir}/usr/share/icons/hicolor/${f%.png}/apps/bloomrpc.png"
  done

  mkdir -p "${pkgdir}/usr/local/bin"
  ln -sf "/opt/BloomRPC/bloomrpc" "${pkgdir}/usr/local/bin/bloomrpc"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
