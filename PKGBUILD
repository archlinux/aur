# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=armitage-git
_pkgname=${pkgname%-git}
pkgver=1.0.0.r3.g991244e
pkgrel=1
pkgdesc="Metasploit GUI Front ened written in java"
url="http://www.fastandeasyhacking.com/"
arch=('any')
license=('GPL')
depends=('metasploit' 'java-environment' 'postgresql')
conflicts=('armitage')
provides=('armitage')
install='armitage.install'

source=("${pkgname}::git+https://github.com/r00t0v3rr1d3/armitage"
        'armitage.install' 'armitage.desktop' 'metasploit.png' 'metasploit.sh'
        'database.yml' 'metasploit.service' 'metasploit.default'
        'added-a-services-column-in-the-host-table-view-with-filter.patch'
        'ui-change-menu-items-list-from-8-to-24.patch')

sha256sums=('SKIP'
            'd5a89e87e81e0169652147681a7c17657b8ced14f90e0e38fa15fac4b6ad5a8d'
            '02c829495ebfb171146e2b02f1c2470f814c41b6c80f0649f59ac62609d18689'
            '7d25e47bbd5cd710020c30fb645229a774672c7bcb451a0cf2fd6ba327d8b141'
            '7869413529c5529b9a0f2bcaaa2be1480382c2f91eb505e43a4f9e1c1eab2d71'
            'b4b4e77895712d16ab9d7402ee53fafcb34c667b7394ae7136d6686be8ee1a2f'
            'ac521ad84eddf680c50c90bbeab3de5c3141da856702de8ac8c31e1ef66154e0'
            'df69997f77fb6460d5f7aba0ff5b592eef5890ce52d2f9e2614e8836fc56eade'
            '83b3cdd5f5ca0d92f4a407700ca8eff716deb0459b557d85aa82d2c4646e5f65'
            'b56531b052f3110a0928633974f1adcbe55b116b53d6c7e3e148ff1b1ec7d461')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    patch -Np1 -i "${srcdir}/added-a-services-column-in-the-host-table-view-with-filter.patch"
    patch -Np1 -i "${srcdir}/ui-change-menu-items-list-from-8-to-24.patch"
}

build() {
    cd "${srcdir}/${pkgname}"

    ./package.sh
    ./clean.sh
}

package() {
    cd "${srcdir}/${pkgname}"

    mkdir -p "${pkgdir}/opt/${_pkgname}" "${pkgdir}/usr/bin"
    cp -r build/*.jar dist/unix/* "${pkgdir}/opt/${_pkgname}/"

    cat > "${pkgdir}/opt/${_pkgname}/armitage" <<-EOF
#!/bin/sh
cd /opt/armitage
java -XX:+UseParallelGC -jar armitage.jar $@
EOF

    chmod +x "${pkgdir}/opt/${_pkgname}/armitage"
    ln -s -t "${pkgdir}/usr/bin" "/opt/${_pkgname}/armitage"

    install -Dm755 "${srcdir}/metasploit.sh" "${pkgdir}/etc/profile.d/metasploit.sh"
    install -Dm644 "${srcdir}/armitage.desktop" "${pkgdir}/usr/share/applications/armitage.desktop"
    install -Dm644 "${srcdir}/metasploit.png" "${pkgdir}/usr/share/icons/metasploit.png"
    install -Dm755 "${srcdir}/metasploit.sh" "${pkgdir}/etc/profile.d/metasploit.sh"
    install -Dm644 "${srcdir}/database.yml" "${pkgdir}/usr/share/metasploit/database.yml.sample"
    install -Dm644 "${srcdir}/metasploit.service" "${pkgdir}/usr/lib/systemd/system/metasploit.service"
    install -Dm644 "${srcdir}/metasploit.default" "${pkgdir}/etc/default/metasploit"

    install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "whatsnew.txt" "${pkgdir}/usr/share/doc/${pkgname}/whatsnew.txt"
    install -Dm644 "readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
}

