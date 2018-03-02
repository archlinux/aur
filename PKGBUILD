# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=duniter-desktop-bin
_pkgname=duniter-desktop
pkgver=1.6.21
pkgrel=1
_gitlab_job_id=3296
pkgdesc="Crypto-currency software to manage libre currency such as Ğ1"
arch=("x86_64")
url="https://duniter.org/fr/"
license=("AGPL3")
provides=("duniter-desktop")
conflicts=("duniter-desktop")
options=('!strip')
source=("https://git.duniter.org/nodes/typescript/duniter/-/jobs/${_gitlab_job_id}/artifacts/raw/work/bin/duniter-desktop-v$pkgver-linux-x64.tar.gz")
sha256sums=('85743b202eccc871805620fd3523409938d814d683648c18168a4091b61781f0')

prepare() {
  cd "$srcdir"

  cat >> duniter-desktop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Duniter Desktop
Comment=Crypto-currency software to manage libre currency such as Ğ1
Icon=duniter-desktop
Exec=/opt/duniter-desktop/nw
Categories=Network;
EOF

  chmod 644 credits.html icudtl.dat natives_blob.bin nw_100_percent.pak \
        nw_200_percent.pak resources.pak snapshot_blob.bin locales/*.pak
  chmod 755 nw lib lib/*.so locales
}

package() {
  cd "$srcdir/"

  install -d -m755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -D -m644 images/duniter-logo.svg \
          "$pkgdir/usr/share/icons/hicolor/scalable/apps/duniter-desktop.svg"
  # weird utf8 error
  rm -r images

  install -d -m755 "$pkgdir/usr/share/applications"
  install -D -m644 duniter-desktop.desktop \
          "$pkgdir/usr/share/applications/duniter-desktop.desktop"
  rm duniter-desktop.desktop

  install -d -m755 "$pkgdir/usr/share/licenses/duniter-desktop"
  install -D -m644 LICENSE \
          "$pkgdir/usr/share/licenses/duniter-desktop/LICENSE"

  install -d -m755 "$pkgdir/opt"
  rm "duniter-desktop-v$pkgver-linux-x64.tar.gz"
  cd ../
  cp -R src "$pkgdir/opt/duniter-desktop"
}
