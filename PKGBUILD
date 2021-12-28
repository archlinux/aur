# Maintainer: Benedikt Rumpf <beru@posteo.de>
# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=dataloader
pkgver=53.0.2
pkgrel=2
pkgdesc="An easy to use graphical tool that helps you to get your data into Salesforce objects"
arch=('i686' 'x86_64')
url="https://developer.salesforce.com/page/Data_Loader"
license=("GPL2")
depends=('java-runtime>=11' 'gtk2' 'gtk-update-icon-cache' 'swt')
makedepends=('git' 'maven' 'java-runtime>=11')
install=dataloader.install
source=(dataloader.desktop dataloader.install dataloader.svg dataloader.sh)
source_i686=(git+https://github.com/forcedotcom/dataloader.git)
source_x86_64=(git+https://github.com/forcedotcom/dataloader.git)
md5sums=('b519f96b515793fa80cd820e25d70d68'
         '94f2b99bb9af44899cd4d2ded981fd54'
         '0b9294d4865f364681a79fbbc73dd88a'
         'b5ee3f35fe3e8475520e76cc58e2f674')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git checkout "tags/v$pkgver"
  git submodule init
  git submodule update
  echo "$pkgver"
}

build() {
  cd "$srcdir/$pkgname"
  latest_version="$(archlinux-java status | grep "java-[0-9][0-9]" | sort --reverse | head --lines 1 | sed 's/(.*)//g')"
  sudo archlinux-java set "${latest_version}"
  mvn clean package -D skipTests -D targetOS=linux_x86_64
}

package() {
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"

  swt_jar="$(readlink --canonicalize /usr/share/java/swt.jar)"

  cp -r "$srcdir/$pkgname" "$pkgdir/opt/"
  cp "${srcdir}/dataloader.sh" "${pkgdir}/opt/${pkgname}/"
  cp "$srcdir/dataloader.svg" "$pkgdir/usr/share/icons/hicolor/48x48/apps/dataloader.svg"
  cp "${swt_jar}" "${pkgdir}/opt/${pkgname}/swt.jar"

  chmod +x "/opt/$pkgname/dataloader.sh"
  chmod g+x "${pkgdir}/opt/${pkgname}/swt.jar"
  chmod o+x "${pkgdir}/opt/${pkgname}/swt.jar"


  ln -s "/opt/$pkgname/dataloader.sh" "$pkgdir/usr/bin/dataloader"

  install -m 644 "$srcdir/dataloader.desktop" "$pkgdir/usr/share/applications/"
}
