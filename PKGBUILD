# Maintainer: ynnsn

pkgname=softmaker-office-nx-bin
pkgver=1506
pkgrel=1
pkgdesc='Proprietary office suite (subscription version)'
arch=('x86_64')
url='https://www.softmaker.com'
license=('LicenseRef-custom')

# Same software installed by the Manjaro package softmaker-office-nx.
provides=('softmaker-office-nx')
conflicts=('softmaker-office-nx')

depends=(
  'bash' 'cairo' 'glib2' 'glibc' 'gst-plugins-base-libs'
  'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libdecor' 'libgcc' 'libgl'
  'libstdc++' 'libx11' 'libxext' 'libxmu' 'libxrandr' 'libxrender'
  'pango' 'zlib'
)

options=('!strip' '!debug')

source=(
  'planmaker-nx.desktop'
  'presentations-nx.desktop'
  'textmaker-nx.desktop'
  'planmakernx'
  'presentationsnx'
  'textmakernx'
  'softmaker-office-nx.xml'
  "https://www.softmaker.net/down/softmaker-office-nx-${pkgver}-amd64.tgz"
)

sha512sums=('ecbc4477727ecff2606256bbb1ae75bc18b28e347d8e8c934ad092c81ca5bef7174c59ea41bb1bac940f90c635bccc8b65ab2f1d4c747c4e8fd934d6b8cc486a'
            '98c82e9cffa3b9d12d960ec3c8f201477be756599e105ae8cb6d1d9d5678f12bd68b5d52de361526d07aaafe838cca84b1e21b6bc24e3fe5db293d66ad115a00'
            '10c16e585bf0be17a51046c725cdbadcffa7ab2826d45b2f7af7e42bd5761f9a92a992bf7d410be29d42703b0aa58a8d9c6765575476ac2f86a2ef5e4eeacfb7'
            '69285ac7d4c6c0bb0a1bce9ed9a1619748fb12c6304dd1ca6ee0878250bf4345761a9b96ba23de6bc190fdb1c53fb5d11eb5d719a24998d449c1a223cb8e244f'
            '4adc7f9debec40c1451f0cbb0d7e3cafb414152839a5c125a7d4e4785be27d1ab2c7cf9d050cb6da9a02903a68ea0cbafc604cdf7f33117e4066cef171612aef'
            '83879bc58e22b58df193ef9434a292b3c4108d72000db85a7739317ecd10630c6ae578a97947a95c782f3838e6f155ce093399a42dc0044e623d5a437f1d4550'
            '94bb97083f6630b883cf1f642a5170ef17de088bfa78210068b9bf65107cc2a5984927f49014cd8040a55d9e0723d3de8ee30875f3dc3bc4f752181d7e04893d'
            '320a3a36e15ffcd148caba3dd3dd312cd3d0f85d020497fec9e48b0c82c7299074fdd1fccaf94fbb60f6d4b0c3cd17e315a711b007c163aa1cdc39e30fd2a936')

package() {
  install -dm755 "${pkgdir}/usr/share/officenx"
  # Avoid importing file ownership from the vendor's nested tarball.
  bsdtar --no-same-owner -xf "${srcdir}/officenx.tar.lzma" \
    -C "${pkgdir}/usr/share/officenx"

  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/planmakernx" \
    "${srcdir}/presentationsnx" \
    "${srcdir}/textmakernx"

  local size
  for size in 16 32 48 64 128 256 512; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/share/officenx/icons/pml_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-planmaker.png"
    ln -s "/usr/share/officenx/icons/prl_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-presentations.png"
    ln -s "/usr/share/officenx/icons/tml_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-textmaker.png"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/share/officenx/icons/pmd_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx.png"
    ln -s "/usr/share/officenx/icons/prd_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prdnx.png"
    ln -s "/usr/share/officenx/icons/tmd_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx.png"
    ln -s "/usr/share/officenx/icons/pmd_oth_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx-oth.png"
    ln -s "/usr/share/officenx/icons/tmd_oth_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx-oth.png"
    ln -s "/usr/share/officenx/icons/pmd_mso_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx-mso.png"
    ln -s "/usr/share/officenx/icons/prd_mso_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prdnx-mso.png"
    ln -s "/usr/share/officenx/icons/tmd_mso_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx-mso.png"
  done

  install -Dm644 "${srcdir}/softmaker-office-nx.xml" \
    "${pkgdir}/usr/share/mime/packages/softmaker-office-nx.xml"
  install -dm755 "${pkgdir}/usr/share/mime-info"
  ln -s /usr/share/officenx/mime/softmaker-office-nx.mime \
    "${pkgdir}/usr/share/mime-info/softmaker-office-nx.mime"

  local desktop
  for desktop in planmaker-nx presentations-nx textmaker-nx; do
    install -Dm644 "${srcdir}/${desktop}.desktop" \
      "${pkgdir}/usr/share/applications/${desktop}.desktop"
  done

  install -Dm644 "${pkgdir}/usr/share/officenx/mime/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
