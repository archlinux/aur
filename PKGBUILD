# Maintainer: Danny Su <contact@dannysu.com>

pkgname=tresorit
pkgver=1.0.125.402
pkgrel=2
pkgdesc='Encrypted cloud storage for your confidential files. Using Tresorit, files are encrypted before being uploaded to the cloud. Start encrypting files for free.'
arch=('i686' 'x86_64')
url="http://www.tresorit.com/"
install=tresorit.install
license=('custom')
optdepends=()
source=("https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run")

sha1sums=('d9a5c88a983bd1945b67a231393771e53b8a5912')

prepare() {
  SKIP=`head tresorit_installer.run | grep "^SKIP" | sed 's/SKIP=//'`
  mkdir -p tresorit
  tail -n+$SKIP tresorit_installer.run | tar xz -C tresorit
}

package() {
  mkdir -p "$pkgdir/opt/tresorit"
  install -Dm755 ../archlinux_user_install "$pkgdir/opt/tresorit/archlinux_user_install"
  install -Dm755 ../systemd_runner "$pkgdir/opt/tresorit/systemd_runner"

  if [ $CARCH == "x86_64" ]; then
      cp -r ./tresorit/tresorit_x64/* "$pkgdir/opt/tresorit"
  else
      cp -r ./tresorit/tresorit_x86/* "$pkgdir/opt/tresorit"
  fi

  echo "Exec=\$HOME/.local/share/tresorit/tresorit --hidden" >> "${pkgdir}"/opt/tresorit/tresorit.desktop
  echo "Icon=/opt/tresorit/tresorit.png" >> "${pkgdir}"/opt/tresorit/tresorit.desktop

  mkdir -p "${pkgdir}"/usr/share/licenses/tresorit
  ln -s /opt/tresorit/LICENSES.txt \
        "${pkgdir}"/usr/share/licenses/tresorit/LICENSE
}
