# Maintainer: Houkime <houkime ät protonmail.com>

pkgname=selfprivacy-git
_name=selfprivacy
pkgver=0.7.0.r50.g90dd3be
pkgrel=1
pkgdesc="Deploy your own private services"
arch=('x86_64')
url="https://selfpricacy.org"
license=('GPL3')
depends=('gnome-keyring' 'jsoncpp' 'libsecret' 'gtk3')
makedepends=('flutter' 'ninja' 'cmake')
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+https://git.selfprivacy.org/kherel/selfprivacy.org.app")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_name}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  flutter --no-version-check --suppress-analytics config --enable-linux-desktop
  cd ${srcdir}/${_name}
  echo pubget $PWD
  flutter --no-version-check --suppress-analytics clean
  flutter --no-version-check --suppress-analytics pub get
  echo pubget end
}

build() {
  cd ${srcdir}/${_name}
  flutter --no-version-check --suppress-analytics build linux --release --verbose
}

package() {
  case "$(uname -m)" in
    "x86_64")
      export FLUTTER_ARCH="x64"
      ;;
  esac

  # install
  install -dm755 ${pkgdir}/opt
  cp -r ${srcdir}/${_name}/build/linux/$FLUTTER_ARCH/release/bundle ${pkgdir}/opt/${_name}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_name}/${_name} ${pkgdir}/usr/bin/${_name}

  # icon
  install -Dm 644 ${srcdir}/${_name}/assets/images/icon/logo_android.png ${pkgdir}/usr/share/pixmaps/${_name}.png

  # desktop entry

  install -dm 755 "${pkgdir}/usr/share/applications"
  install -m 755 ${srcdir}/${_name}/org.selfprivacy.app.desktop ${pkgdir}/usr/share/applications/${_name}.desktop
}
