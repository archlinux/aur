# Maintainer: Austin Keller <austin474@gmail.com>

_pkgname=roam-research
pkgname=roam-research
pkgver=0.0.15
pkgrel=1
pkgdesc="A note-taking tool for networked thought"
arch=('any')
url="https://roamresearch.com/"
license=('custom')
depends=()
source=(
  "$_pkgname-$pkgver.tgz::https://roam-electron-deploy.s3.us-east-2.amazonaws.com/${_pkgname}_${pkgver}_amd64.deb"
  "LICENSE"
)
md5sums=(
  '61428ab6ff6523cc1c53e7dfb26cebbb'
  '34234c4e196ceeaf00e4ee7f29b9fb63'
)

prepare() {
  tar -xvf data.tar.xz
}

package() {
  cd "$srcdir"

  # Making paths work with a space is error-prone, so let's replace with a simpler kebab-case directory
  sed -i "s/\/opt\/Roam Research/\/opt\/$_pkgname/" usr/share/applications/roam-research.desktop

  # Install all the things
  install -d "$pkgdir"/{opt/$_pkgname,usr/share,usr/bin}
  cp -r opt/Roam\ Research/* -t "$pkgdir"/opt/$_pkgname
  cp -r usr/share/* -t "$pkgdir"/usr/share

  # Make the desktop icons available
  # (not sure why they're under 0x0? Where is that used?)
  install -d "$pkgdir"/usr/share/icons/hicolor/1024x1024
  cp -r usr/share/icons/hicolor/0x0/* -t "$pkgdir"/usr/share/icons/hicolor/1024x1024
  install -d "$pkgdir"/usr/share/pixmaps
  install -D usr/share/icons/hicolor/0x0/apps/roam-research.png -t "$pkgdir"/usr/share/pixmaps

  # Make the binary available in the $PATH
  ln -s /opt/${_pkgname}/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}

  # Add a license that links to the Terms and Conditions and Privacy Policy from https://roamresearch.com
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
