pkgname=briar-desktop-bin
_pkgname=briar-desktop
pkgver=0.4.1.beta
pkgrel=1
_bin_ver=0.4.1
_build_type=beta
pkgdesc='Prototyping the next generation for Briar on desktop devices'
arch=(any)
url="https://code.briarproject.org/briar/briar-desktop"
license=('GPL')
depends=('java-runtime=17' 'bash')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=("https://desktop.briarproject.org/jars/linux/${_bin_ver}-${_build_type}/${_pkgname}-linux-${_bin_ver}-${_build_type}.jar"
        "${_pkgname}.svg::https://code.briarproject.org/briar/${_pkgname}/-/raw/main/${_pkgname}/src/main/resources/images/logo_circle.svg"
        "briar16.png" "briar32.png" "briar48.png" "briar64.png" "briar128.png" "briar192.png"
        "${_pkgname}.desktop"
        "https://code.briarproject.org/briar/briar-desktop/-/raw/${_bin_ver}-${_build_type}/${_pkgname}/src/appResources/linux/org.briarproject.Briar.metainfo.xml")
noextract=("${_pkgname}-linux-${_bin_ver}-${_build_type}.jar")
sha256sums=('fea0160e6da96d5a0963a9b0d937af468b4ea64e78652ceb28f4e668a4ff7bc3'
            '95400a8578272600e0b350c4b664c09631c737ce11e750faefe27473460d7923'
            '965d7c617e345b809f84c8bf73d9cb0acaf763c16a4b367698218b90c1c92669'
            '3feb96f9b9c01085170a44fdbf8bca43b1e586fe3b68dab37fb5cb9fd4ca1fa6'
            '3ba1a6a3561f3b879d8295cf3397bda6c7710f138f6cbd7effe4f650765610a0'
            '25eb65911af5e85d193e0d60418757a2ffe7b3d7d9d3debc41259bc0503972a7'
            '2a3e508279c2a440372bf73da2c4acf56a9b7a0bcad886a74863f5a723413a93'
            'a00d60b7aa59fb573c2e42f8bb4c23eb7038c91ea5ced47ebf9d537e3f3925cf'
            'ac7f0dc86bce256dc80fbee7c65705b6dc9cdbd8f0ad942f0535f82b65ef2f83'
            '50173038d2f1f8d750a8c939b390b865394b91b4fb0b19832e0153553f11034a')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
exec /usr/lib/jvm/java-17-openjdk/bin/java -jar '/usr/share/java/briar-desktop.jar' "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  install -m 644 -D ${_pkgname}-linux-${_bin_ver}-${_build_type}.jar "$pkgdir/usr/share/java/$_pkgname.jar"

  install -Dm644 ${srcdir}/briar-desktop.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  # generated with inkscape from the svg
  # just seemed unreasonable to require inkscape as a makedep
  # for size in 16 32 48 64 128 192; do
  # inkscape --export-background-opacity=0 \
  #     --export-width=${size} --export-type=png \
  #     --export-filename=${size}.png briar-desktop.svg
  # done

  for i in 16 32 48 64 128 192; do
    install -Dm644 ${srcdir}/briar${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 ${srcdir}/$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 ${srcdir}/org.briarproject.Briar.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.briarproject.Briar.metainfo.xml"
}
