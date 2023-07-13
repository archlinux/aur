# Mantainer: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>, WithTheBraid <the-one@with-the-braid.cf>

pkgname=('flutter-light-common' 'flutter-light-android-arm' 'flutter-light-android-arm64' 'flutter-light-android-x86' 'flutter-light-android-x64' 'flutter-light-web' 'flutter-light-linux')
pkgbase=flutter-light
pkgver=3.10.5
pkgrel=1
makedepends=("python")
optdepends=("android-sdk" "android-studio" "intellij-idea-community-edition" "intellij-idea-ultimate-edition" "cmake" "ninja" "perl" "python")

arch=("x86_64" "aarch64")
url="https://flutter.dev"
license=("custom" "BSD" "CCPL")
options=("emptydirs" "!strip")
source=(
  "flutter.sh"
)

sha256sums=('6ba1a8b996300bb6222915d99a19945c5a5ef062550413559d5bb124bd6cf1e9')

prepare() {
  if [ ! -e $srcdir/flutter ]; then
    git clone https://github.com/flutter/flutter.git --depth 1 -b stable
  fi
  cd $srcdir/flutter
  git clean -dfx
  _ver=$(git tag -l)
  if [[ $_ver != $pkgver  ]]; then
	git pull --update-shallow
  fi
  _ver=$(git tag -l)
  if [[ $_ver != $pkgver  ]]; then
  	exit 1
  fi
  sed -i "/\"\$FLUTTER_ROOT\/bin\/internal\/update_dart_sdk.sh\"/d" "${srcdir}/flutter/bin/internal/shared.sh"
  mkdir -p "${srcdir}/flutter/bin/cache/"
  ln -sf "/opt/dart-sdk" "${srcdir}/flutter/bin/cache/"
  "${srcdir}/flutter/bin/flutter" --no-version-check precache
}

package_flutter-light-common() {
  provides=(flutter)
  conflicts=(flutter)
  depends=("git" "glu" "java-environment>=8" "libglvnd" "unzip" "dart" "flutter-light-android-arm64" "dart")
  arch=("x86_64" "aarch64")
  backup=("opt/flutter/packages/flutter_test/pubspec.yaml" "opt/flutter/packages/flutter/pubspec.yaml")
  pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android. Using the dart package provided by Arch devs (slower updates)"
  
  install -Dm644 "${srcdir}/flutter/LICENSE" "${pkgdir}/usr/share/licenses/flutter/LICENSE"
  install -Dm755 "${srcdir}/flutter.sh" "${pkgdir}/usr/bin/flutter"
  install -dm755 "${pkgdir}/opt/flutter"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/flutter" "${pkgdir}/opt/"
  rm -rf ${pkgdir}/opt/flutter/bin/cache/artifacts/engine/{android*,linux*} ${pkgdir}/opt/flutter/bin/cache/flutter_web_sdk

  # version overriding, something broken; not my fault *grumble*
  echo "${pkgver}" > "${pkgdir}/opt/flutter/version" 
  find "${pkgdir}/opt/flutter" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/flutter" -type f -exec chmod a+r {} +

  # those files *must* be read-write for end-users; not my fault *grumble*
  chmod a+rw "${pkgdir}/opt/flutter"
  chmod -R a+rw "${pkgdir}/opt/flutter/version" "${pkgdir}/opt/flutter/bin/cache" "${pkgdir}/opt/flutter/.git"
  find "${pkgdir}/opt/flutter" -name "pubspec.lock" -exec chmod a+rw {} +
  find "${pkgdir}/opt/flutter" -name "package_config.json" -exec chmod a+rw {} +
  find "${pkgdir}/opt/${pkgname}" -name "package_config.json" -exec chmod a+rw {} +
}

package_flutter-light-android-arm() {
  depends=("flutter-light-common")
  
  install -dm755 "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
  cp -ra "${srcdir}/flutter/bin/cache/artifacts/engine/android-arm" "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/flutter/bin/cache/artifacts/engine/android-arm-* ${pkgdir}/opt/flutter/bin/cache/artifacts/engine
  chmod -R a+rw "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
}

package_flutter-light-android-arm64() {
  depends=("flutter-light-common")
  
  install -dm755 "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/flutter/bin/cache/artifacts/engine/android-arm64* ${pkgdir}/opt/flutter/bin/cache/artifacts/engine
  
  chmod -R a+rw "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
}

package_flutter-light-android-x86() {
  depends=("flutter-light-common")

  install -dm755 "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/flutter/bin/cache/artifacts/engine/android-x86* ${pkgdir}/opt/flutter/bin/cache/artifacts/engine
  
  chmod -R a+rw "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
}

package_flutter-light-android-x64() {
  depends=("flutter-light-common")

  install -dm755 "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/flutter/bin/cache/artifacts/engine/android-x64 ${pkgdir}/opt/flutter/bin/cache/artifacts/engine
  
  chmod -R a+rw "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
}

package_flutter-light-web() {
  depends=("flutter-light-common")

  install -dm755 "${pkgdir}/opt/flutter/bin/cache"
  cp -ra "${srcdir}/flutter/bin/cache/flutter_web_sdk" "${pkgdir}/opt/flutter/bin/cache"
  
  chmod -R a+rw "${pkgdir}/opt/flutter/bin/cache/flutter_web_sdk"
}

package_flutter-light-linux() {
  depends=("flutter-light-common")

  install -dm755 "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
  cp -ra ${srcdir}/flutter/bin/cache/artifacts/engine/linux* ${pkgdir}/opt/flutter/bin/cache/artifacts/engine
  
  chmod -R a+rw "${pkgdir}/opt/flutter/bin/cache/artifacts/engine"
}
