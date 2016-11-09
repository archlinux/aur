# Maintainer: Danny Su <contact@dannysu.com>

pkgname=tresorit
pkgver=1.0.280.512
pkgrel=2
pkgdesc='Encrypted cloud storage for your confidential files. Using Tresorit, files are encrypted before being uploaded to the cloud. Start encrypting files for free.'
arch=('i686' 'x86_64')
url="http://www.tresorit.com/"
install=tresorit.install
license=('custom')
optdepends=()
source=("https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run")

sha1sums=('5ed8ebd8ce4af947847f8ef209464465558f22a6')

prepare() {
  # Validate signature
  head -c1044 tresorit_installer.run | tail -c+20 | xxd -r -p > tresorit_installer.run.signature
  VERIFICATION_RESULT=`tail -c+1046 tresorit_installer.run | openssl sha512 -verify ../tresorit_installer.run.pubkey -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature tresorit_installer.run.signature`
  if [ "$VERIFICATION_RESULT" != "Verified OK" ]; then
    echo "    ! Binary signature verification failed"
    exit 1
  fi

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
