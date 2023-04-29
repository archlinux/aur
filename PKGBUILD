# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=briar-desktop
_app_nightly_name="${_app_name}-nightly"
pkgname="${_app_nightly_name}-bin"
pkgver=27821
pkgrel=1
pkgdesc="Prototyping the next generation for Briar on desktop devices"
arch=('any')
url='https://code.briarproject.org/briar/briar-desktop'
license=('AGPL3')
provides=("${_app_nightly_name}")
depends=('java-runtime>=17' 'bash')
_jar_source="https://code.briarproject.org/briar/${_app_name}/-/jobs/artifacts/main/raw/${_app_name}-linux.jar?job=b_package_linux_x64"
source=("${_app_nightly_name}.jar::${_jar_source}"
        "${_app_name}.svg"
        "briar16.png"
        "briar32.png"
        "briar48.png"
        "briar64.png"
        "briar128.png"
        "briar192.png"
        "${_app_nightly_name}.desktop")
noextract=("${_app_nightly_name}.jar")
sha256sums=('SKIP'
            '95400a8578272600e0b350c4b664c09631c737ce11e750faefe27473460d7923'
            '965d7c617e345b809f84c8bf73d9cb0acaf763c16a4b367698218b90c1c92669'
            '3feb96f9b9c01085170a44fdbf8bca43b1e586fe3b68dab37fb5cb9fd4ca1fa6'
            '3ba1a6a3561f3b879d8295cf3397bda6c7710f138f6cbd7effe4f650765610a0'
            '25eb65911af5e85d193e0d60418757a2ffe7b3d7d9d3debc41259bc0503972a7'
            '2a3e508279c2a440372bf73da2c4acf56a9b7a0bcad886a74863f5a723413a93'
            'a00d60b7aa59fb573c2e42f8bb4c23eb7038c91ea5ced47ebf9d537e3f3925cf'
            'db1a6d2c1ee5dc3f8571642e092d6a2182f0595398d676d23c278d5d084f4743')

pkgver() {
    local build_job_number=$(curl -I -s "${_jar_source}" | grep -E ^location: | grep -E -o '[[:digit:]]+')
    echo -n "${build_job_number}"
}

package() {
    install -dm755 "$pkgdir/usr/bin/"
    cat << EOF > "$pkgdir/usr/bin/${_app_nightly_name}"
#!/bin/sh
exec /usr/bin/env java -jar '/usr/share/java/briar-desktop-nightly.jar' "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/${_app_nightly_name}"

    install -m 644 -D "${_app_nightly_name}.jar" "$pkgdir/usr/share/java/${_app_nightly_name}.jar"

    install -C -Dm644 "${srcdir}/${_app_name}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_nightly_name}.svg"

    # Taken from briar-desktop-bin/briar-desktop-git
    # generated with inkscape from the svg
    # just seemed unreasonable to require inkscape as a makedep
    # for size in 16 32 48 64 128 192; do
    # inkscape --export-background-opacity=0 \
    #     --export-width=${size} --export-type=png \
    #     --export-filename=${size}.png briar-desktop.svg
    # done

    for i in 16 32 48 64 128 192; do
        install -C -Dm644 "${srcdir}/briar${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_app_nightly_name}.png"
    done

    install -Dm644 "${srcdir}/${_app_nightly_name}.desktop" "$pkgdir/usr/share/applications/${_app_nightly_name}.desktop"
}
