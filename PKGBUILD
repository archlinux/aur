# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
pkgname=esa-snap-bin
pkgver=9.0.0
pkgrel=2
pkgdesc="ESA SNAP Toolbox for Sentinel Satellite data"
arch=("x86_64")
url="http://step.esa.int/main/"
license=('GPL3')
options=("!strip")
provides=("esa-snap")
depends=("java-runtime=8")
# Official download page: http://step.esa.int/main/download/snap-download/
source=("https://download.esa.int/step/snap/${pkgver:0:3}/installers/${pkgname/-bin/}_all_unix_${pkgver//./_}.sh"
    "snap-conf-optimiser.desktop"
    "snap-desktop.desktop"
    "response.varfile"
    "esa-snap-desktop.png"
        )
noextract=("${pkgname/-bin/}_all_unix_${pkgver//./_}.sh")
md5sums=("d7db246ed952832261b4bdae98a03246"
         "29553527b1347b404ee9f132f0928025"
         "173a97ca7af76079bacbbee667fd5013"
         "171e808a3ba22fb6a522aa318a8703db"
         "5adb217028dbe9d6e1aea75412b81a7d"
)
sha256sums=("ad6ef8c679c80c58660fe23ab5fb4974f9cd3ff4b119ad8e7e40dc79dbe03896"
            "1fb2161e9d0bc16093a193ff2008c89c0a788053ce448f3e248b9cd9998998e0"
            "e02744cd13df4aed9cd5e8f81ef59d35a44e00eb2a0ddce9587d71b3adcf9192"
            "97f680aec00cc74ec2f202aba1e0132c461d631d705203ab613371c9c4c28f2d"
            "83d4cc2d0d2f5f21295eab6511be0dc7d5773b5b2460f61b52ac6b0200f1872e"
)


package() {
    cd "$srcdir"
    installdir="/opt/esa-snap"
    jvm_home="/usr/lib/jvm/java-8-openjdk/jre/"
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/applications"

    # java.util.prefs.userRoot is set to silence some warnings during install. We have to delete it afterwards
    sh "${pkgname/-bin/}_all_unix_${pkgver//./_}.sh" -q -dir "${pkgdir}/${installdir}" -J-Djava.util.prefs.userRoot="${pkgdir}/" -Vsys.symlinkDir=${pkgdir}/usr/bin

    # Desktop files refer to the installed directory:
    sed "s#INSTALLDIR#${installdir}#" "${srcdir}"/snap-desktop.desktop        > "${srcdir}"/fixed-snap-desktop.desktop
    sed "s#INSTALLDIR#${installdir}#" "${srcdir}"/snap-conf-optimiser.desktop > "${srcdir}"/fixed-snap-conf-optimiser.desktop

    install -Dm 644 "${srcdir}"/fixed-snap-desktop.desktop        "${pkgdir}"/usr/share/applications/esa-snap-desktop.desktop
    install -Dm 644 "${srcdir}"/fixed-snap-conf-optimiser.desktop "${pkgdir}"/usr/share/applications/esa-snap-conf-optimiser.desktop
    install -Dm 644 "${srcdir}"/esa-snap-desktop.png              "${pkgdir}"/usr/share/icons/esa-snap-desktop.png

    install -Dm 644 "${pkgdir}"/"${installdir}"/.install4j/i4j_extf_3_1buu1c8.jpg  "${pkgdir}"/"${installdir}"/bin/SNAP_icon_48.jpg
    install -Dm 644 "${pkgdir}"/"${installdir}"/.install4j/snap-conf-optimiser.png "${pkgdir}"/usr/share/icons/snap-conf-optimiser.png

    # Set -Xmx to two thirds of system memory. Seems to be what the installer does.
    maxmem="$(awk '/MemTotal/{print int(($2/1024^2) * .7)}' /proc/meminfo)"
    sed "s/-Xmx[^ ]*/-Xmx${maxmem}G/" -i "${pkgdir}"/"${installdir}"/etc/snap.conf

    # Change JDK to the one provided by the distro
    sed "s#^jdkhome.*#jdkhome=\"${jvm_home}\"#" -i "${pkgdir}"/"${installdir}"/etc/snap.conf

    # Keep files required for snap-conf-optimiser
    mv "${pkgdir}"/"${installdir}"/.install4j "${pkgdir}"/"${installdir}"/.uninstall4j/
    for jar in $(cat "${pkgdir}"/"${installdir}"/bin/snap-conf-optimiser |sed -n '/^i4j_classpath/{s/:.*install4j./ /;s/.*install4j.//;s/"$//p}'); do
        install -Dm 644 "${pkgdir}"/"${installdir}"/.uninstall4j/"${jar}" "${pkgdir}"/"${installdir}"/.install4j/"${jar}"
    done
    echo "${jvm_home}" >  "${pkgdir}/${installdir}/".install4j/pref_jre.cfg;

    # Deleting java user root
    # Also removing the accompanying jre. 
    rm -r "${pkgdir}"/.java "${pkgdir}"/"${installdir}"/jre "${pkgdir}"/"${installdir}"/.uninstall4j/
    # Clean up desktop files
    rm "${pkgdir}"/"${installdir}"/'SNAP Configuration Optimiser.desktop' "${pkgdir}"/"${installdir}"/'SNAP Desktop.desktop'
}
