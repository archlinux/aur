pkgname=passy
_pkgshortname=passy
pkgver=1.7.0.r0.g29e8f66
pkgrel=1
pkgdesc='Offline password manager with cross-platform synchronization'
arch=('x86_64')
url='https://github.com/GlitterWare/Passy'
license=(GPL)
provides=('passy')
depends=('gtk3' 'git' 'glu' 'java-environment' 'libglvnd' 'unzip' 'cmake' 'ninja')
source=('git+https://github.com/GlitterWare/Passy.git')
sha512sums=('SKIP')
_flutter='submodules/flutter/bin/flutter --no-version-check --suppress-analytics --verbose'

pkgver() {
  cd Passy
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # flutter build
  cd Passy
  git reset --hard $(git describe --tags $(git rev-list --tags --max-count=1))
  git submodule init
  git submodule update
  export PATH="$PATH:$PWD/submodules/flutter/bin"
  $_flutter config --no-analytics
  $_flutter build linux --dart-define=UPDATES_POPUP_ENABLED=false
  cd ..

  # change the package name
  if [ -d 'linux_assets' ]; then
    rm -rf linux_assets
  fi
  mkdir -p linux_assets
  cp -r Passy/linux_assets .
  cd linux_assets
  sed -i s/com.glitterware.passy/$_pkgshortname/ com.glitterware.passy.appdata.xml
  sed -i s/com.glitterware.passy/$_pkgshortname/ com.glitterware.passy.desktop
  cd ..
}

package() {
  case "$(uname -m)" in
    'x86_64')
      export FLUTTER_ARCH=x64
      ;;
    'aarch64')
      export FLUTTER_ARCH=arm64
      ;;
  esac

  # install
  install -dm755 ${pkgdir}/opt
  mv Passy/build/linux/$FLUTTER_ARCH/release/bundle ${pkgdir}/opt/${_pkgshortname}

  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgshortname}/${_pkgshortname} ${pkgdir}/usr/bin/${_pkgshortname}

  # icon
  install -Dm644 Passy/logo.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgshortname}.png

  # desktop entry
  install -dm755 $pkgdir/usr/share/applications
  install -Dm644 linux_assets/com.glitterware.passy.desktop $pkgdir/usr/share/applications/${_pkgshortname}.desktop

  # metainfo
  install -dm755 $pkgdir/usr/share/metainfo
  install -Dm644 linux_assets/com.glitterware.passy.appdata.xml $pkgdir/usr/share/metainfo/${_pkgshortname}.appdata.xml
}
