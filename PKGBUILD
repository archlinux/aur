# Maintainer: Gerardo Junior <me@gerardo-junior.com>
# Maintainer: Xaver Hellauer <software@hellauer.bayern>

pkgname=tresorit
pkgver=3.5.1244.4360
pkgrel=1
pkgdesc='Encrypted cloud storage for your confidential files. Using Tresorit, files are encrypted before being uploaded to the cloud. Start encrypting files for free.'
arch=('i686' 'x86_64')
url="http://www.tresorit.com/"
install=tresorit.install
license=('custom:tresorit')
depends=(bash libglvnd)
makedepends=('xxd' 'sed')
source=("tresorit_installer_${pkgver}.run::https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run"
        "https://support.tresorit.com/hc/en-us/article_attachments/25125072592530"
        "tresorit.service")
sha512sums=('a329ee3e5870481dd357d389da664711230add49c7ba74db04bd0bb0116b6ffde9930e6a320481d4d7d1ee0ed00b2afaa38ede948da16fe81e4faf7e07a817e9'
            '73515383174adc51c9da24e6f238e92ede445cbf75d55f927cb51a1a57f630ed95eda2740ac52d2997daf6105f2e22f11591b3208c4296c7d614daaa5f3c57ed'
            '58aa3738fd17d5930ed76b9491a3ef0dd481b918f5329b56650e6d77078ad74caeea60c9cf83d524a483a9be7fc41aba2712400922d4ab3db775f1c2a1365765')

prepare() {
  # NOTE: signature verification is temporarily disabled because it no longer
  # works with OpenSSL 3. I reached out to tresorit via email, asking them to
  # update their script to work with OpenSSL 3.

  # # Validate signature
  # sed -i -- "s/tresorit_installer.run/tresorit_installer_${pkgver}.run/g" check_signature.sh
  # chmod u+x check_signature.sh
  # VERIFICATION_RESULT=`./check_signature.sh`
  # echo "$VERIFICATION_RESULT"
  # if [ "$VERIFICATION_RESULT" != "Verified OK" ]; then
  #   echo "    ! Binary signature verification failed"
  #   exit 1
  # fi

  SKIP=`head tresorit_installer_${pkgver}.run | grep "^SKIP" | sed 's/SKIP=//'`
  mkdir -p tresorit
  tail -n+$SKIP tresorit_installer_${pkgver}.run | tar xz -C tresorit
}

package() {
  mkdir -p "${pkgdir}/opt/$pkgname"
  install -Dm755 ../archlinux_user_install "$pkgdir/opt/tresorit/archlinux_user_install"
  install -Dm755 ../systemd_runner "$pkgdir/opt/tresorit/systemd_runner"
  install -Dm644 "$srcdir"/tresorit.service "$pkgdir"/usr/lib/systemd/user/tresorit.service

  if [ $CARCH == "x86_64" ]; then
      cp -r ./tresorit/tresorit_x64/* "$pkgdir/opt/$pkgname"
  else
      cp -r ./tresorit/tresorit_x86/* "$pkgdir/opt/$pkgname"
  fi

  echo "Exec=\$HOME/.local/share/tresorit/tresorit --hidden" >> "${pkgdir}"/opt/tresorit/tresorit.desktop
  echo "Icon=/opt/tresorit/tresorit.png" >> "${pkgdir}"/opt/tresorit/tresorit.desktop

  mkdir -p "${pkgdir}"/usr/share/licenses/tresorit
  ln -s /opt/tresorit/LICENSES.txt \
        "${pkgdir}"/usr/share/licenses/tresorit/LICENSE
}
