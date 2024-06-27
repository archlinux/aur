# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Lu Xu <oliver_lew@outlook.com>
# Contributor: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com>
# Contributor: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Iñigo Alvarez <alvarezviu@gmail.com>
# Contributor: William Termini <aur@termini.me>

pkgname=minivmac
pkgver=36.04
pkgrel=5
pkgdesc="A miniature early Macintosh emulator"
arch=('x86_64' 'i686') 
url="https://www.gryphel.com/c/minivmac/"
_url_d="https://www.gryphel.com/d/minivmac"
_api="sdl"
license=('GPL2')
depends=('bash' 'libx11' 'sdl')
source=(${pkgname}-${pkgver}.tgz::"${_url_d}/${pkgname}-${pkgver}/$pkgname-$pkgver.src.tgz"
        minivmac.desktop
        minivmac.png
        blanks-1.1.zip::"${_url_d}/extras/blanks/blanks-1.1.zip"
        clipin-1.1.0.zip::"${_url_d}/extras/clipin/clipin-1.1.0.zip"
        clipout-1.1.0.zip::"${_url_d}/extras/clipout/clipout-1.1.0.zip"
        dafkey-1.1.0b.zip::"${_url_d}/extras/dafkey/dafkey-1.0.0b.zip"
        exportfl-1.3.1.zip::"${_url_d}/extras/exportfl/exportfl-1.3.1.zip"
        exportps-1.0.0.zip::"${_url_d}/extras/exportps/exportps-1.0.0.zip" 
        minivmac.man::"https://raw.githubusercontent.com/ajacocks/minivmac-aur/beta/minivmac.man"
        importfl-1.2.2.zip::"${_url_d}/extras/importfl/importfl-1.2.2.zip")
sha256sums=('9b7343cec87723177a203e69ad3baf20f49b4e8f03619e366c4bf2705167dfa4'
            'b7790404a7ef404234cf25d5e29c0e830827841c02519999f321e330c02366ac'
            'f003d3c5a92442f3f143153879a7a21e301d447e850ebba119605a2a733f6e2b'
            '3c3040148c0e128a8402ac0fa3494098b0dee7df7bd06b26e9196c5dd1addff3'
            'ef4912e9d10471ddfc1e4976ccf98d0bf76e9ef5ad2f8748c548d44714127223'
            '29c5e3c2604f9e6e9dcaf48cc716c17f8a89333fcf37770878c40382b62c4d92'
            'bb1b62edbb0729d09db49026ca8108c4a610e2b1d219f7c5644b7f66501c98b8'
            'aa263b994e15eea8ccbef05c04d40ad6a968f68a87a6a496d00671e75937a17e'
            '633a531500854af6e899ab6501fdf6b0060f6100bba726421aa6f37a860f6f7b'
            'f3d913c3a039f394c04c255f100f91541b4885f7f48d87c0373356806027dca3'
            'bd6e70489d9bac12d9012634f4f5ae51f30a2c5d647fe3b2b071ff1b5a649419')

build() {
  OPTIONS="-api ${_api} -n '${pkgname}-${_model}_v${pkgver}-${pkgrel}'"
  cd ${pkgname}
  mkdir -p bin
  gcc setup/tool.c -o setup_t
  # build all supported models
  for _model in 128K 512Ke Plus SE Classic SEFDHD II; do
    model_lower=$(echo $_model | tr '[:upper:]' '[:lower:]')
    # In common 1080p monitors, the magnify options work well
    #[ $_model = II ] && option_mf=2 || option_mf=3
    echo Architecture is $CARCH.
    if [ "${CARCH}" = "x86_64" ]; then
      ./setup_t -t lx64 -m ${_model} $OPTIONS | bash
    elif [ "${CARCH}" = "i686" ]; then
      ./setup_t -t lx86 -m ${_model} $OPTIONS | bash
    else
      echo "Architecture $CARCH is not supported by this PKGBUILD."
      exit 1
    fi
    make
    mv minivmac bin/"minivmac-$model_lower"
    sed -e "s;^Exec=.*;Exec=/usr/bin/minivmac-${model_lower};" \
        -e "s;^Name=.*;Name=Mini vMac ${_model};" \
        ${srcdir}/${pkgname}.desktop > ${srcdir}/minivmac-${model_lower}.desktop
  done
}

package() {
  # icon and desktop entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  for _model in 128K 512Ke Plus SE Classic SEFDHD II; do
    model_lower=$(echo $_model | tr '[:upper:]' '[:lower:]')
    install -Dm644 "${srcdir}/${pkgname}-${model_lower}.desktop" "${pkgdir}/usr/share/applications/${pkgname}-${model_lower}.desktop"
  done
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  cd ${pkgname}
  # install docs
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname
  install -m0644 COPYING.txt "$pkgdir"/usr/share/doc/$pkgname/COPYING.txt
  install -m0644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
  # install all model-specific executables
  install -dm755 "$pkgdir"/usr/bin/
  install -Dm755 bin/"${pkgname}"* "$pkgdir"/usr/bin/
  # set minimac to default to Macintosh Plus emulation
  ln -s /usr/bin/$pkgname-plus "$pkgdir"/usr/bin/$pkgname

  cd -
  # create a disk storage directory
  install -dm755 "$pkgdir"/usr/share/$pkgname/disks
  # install man pages
  install -Dm755 minivmac.man "${pkgdir}/usr/share/man/man1/$pkgname.1"
  for _model in 128K 512Ke Plus SE Classic SEFDHD II; do
    model_lower=$(echo $_model | tr '[:upper:]' '[:lower:]')
    ln -s "${pkgdir}/usr/share/man/man1/$pkgname.1" "${pkgdir}/usr/share/man/man1/$pkgname-${model_lower}.1"
  done
  # create a ROM storage directory
  install -dm755 "$pkgdir"/usr/share/$pkgname/roms
  # Extras
  ########
  # install blank disks
  tar cf - blanks-1.1 | ( cd "$pkgdir"/usr/share/$pkgname/disks; tar xvf - )
  mv "$pkgdir"/usr/share/$pkgname/disks/blanks-1.1 "$pkgdir"/usr/share/$pkgname/disks/blanks
  # install clipin
  install -Dm644 clipin-1.1.0/clipin-1.1.0.dsk "$pkgdir"/usr/share/$pkgname/disks/clipin-1.1.0.dsk
  install -Dm644 clipin-1.1.0/clipin-1.1.0.md5.txt "$pkgdir"/usr/share/$pkgname/disks/clipin-1.1.0.md5.txt
  # install clipout
  install -Dm644 clipout-1.1.0/clipout-1.1.0.dsk "$pkgdir"/usr/share/$pkgname/disks/clipout-1.1.0.dsk
  install -Dm644 clipout-1.1.0/clipout-1.1.0.md5.txt "$pkgdir"/usr/share/$pkgname/disks/clipout-1.1.0.md5.txt
  # install dafkey
  install -Dm644 dafkey-1.0.0/dafkey-1.0.0.dsk "$pkgdir"/usr/share/$pkgname/disks/dafkey-1.0.0.dsk
  install -Dm644 dafkey-1.0.0/dafkey-1.0.0.md5.txt "$pkgdir"/usr/share/$pkgname/disks/dafkey-1.0.0.md5.txt
  # install exportfl
  install -Dm644 exportfl-1.3.1/exportfl-1.3.1.dsk "$pkgdir"/usr/share/$pkgname/disks/exportfl-1.3.1.dsk
  install -Dm644 exportfl-1.3.1/exportfl-1.3.1.md5.txt "$pkgdir"/usr/share/$pkgname/disks/exportfl-1.3.1.md5.txt
  # install exportps
  install -Dm644 exportps-1.0.0/exportps-1.0.0.dsk "$pkgdir"/usr/share/$pkgname/disks/exportps-1.0.0.dsk
  install -Dm644 exportps-1.0.0/exportps-1.0.0.md5.txt "$pkgdir"/usr/share/$pkgname/disks/exportps-1.0.0.md5.txt
  # install importfl
  install -Dm644 importfl-1.2.2/importfl-1.2.2.dsk "$pkgdir"/usr/share/$pkgname/disks/importfl-1.2.2.dsk
  install -Dm644 importfl-1.2.2/importfl-1.2.2.md5.txt "$pkgdir"/usr/share/$pkgname/disks/importfl-1.2.2.md5.txt
}
