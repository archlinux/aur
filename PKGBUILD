# Maintainer: Márk Sági-Kazár <mark.sagikazar@gmail.com>
# Maintainer: Bence Hornák <hornak.bence@gmail.com>

pkgname=anyk
pkgver=2.96.0
subver=0.1
pkgrel=1
pkgdesc='Form fill program of the hungarian tax office (Általános Nyomtatványkitöltő (ÁNYK))'
arch=('any')
url='https://www.nav.gov.hu/nav/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/keretprogramok/abevjava_install.html'
license=('proprietary')
depends=('java8-openjfx')
makedepends=('unzip')
provides=('abevjava')
source=("https://www.nav.gov.hu/data/cms520681/abevjava_install-${pkgver}-${subver}.noarch.rpm"
        'abevjava'
        'abevjavapath.cfg'
        'anyk.desktop'
        'setenv'
        'anyk.sysusers')
md5sums=('15f866c6d000a44c356446f5a4c55490'
         '14e676f715c1008dda83ffd7c3a127ec'
         '5dae655a84d5dd76401011f5629d8f0f'
         '01c88871539646e6c645c1a30c3c206d'
         '2e0fae11fbaa20d376a1228ac0262209'
         'b13f867247c573d73509520ffd02de56')

package() {
    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/usr/share/abevjava"
    install -d -m 755 "${pkgdir}/etc"

    unzip -oq "$srcdir/usr/share/abevjava/abevjava_install-$pkgver-${subver}.jar" -d "$srcdir"
    install -m 655 "${srcdir}"/setenv "${pkgdir}"/usr/share/abevjava
    install -m 655 "${srcdir}"/abevjava "${pkgdir}"/usr/bin
    install -m 644 "${srcdir}"/abevjavapath.cfg "${pkgdir}"/etc

    install -D "${srcdir}/${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
	  install -Dm 644 "${srcdir}"/application/abevjava.png "${pkgdir}"/usr/share/pixmaps/abevjava.png

    cp -r "${srcdir}"/application/* "${pkgdir}"/usr/share/abevjava

    # Create anyk group and set download folder writable for group members
    install -Dm 644 "${srcdir}/anyk.sysusers" "${pkgdir}/usr/lib/sysusers.d/anyk.conf"
    
    chgrp -R 169 "${pkgdir}/usr/share/abevjava/abev"
    chgrp -R 169 "${pkgdir}/usr/share/abevjava/eroforrasok"
    chgrp -R 169 "${pkgdir}/usr/share/abevjava/nyomtatvanyok"
    chgrp -R 169 "${pkgdir}/usr/share/abevjava/upgrade"
    chgrp -R 169 "${pkgdir}/usr/share/abevjava/segitseg"

    chmod -R g=u "${pkgdir}/usr/share/abevjava/abev"
    chmod -R g=u "${pkgdir}/usr/share/abevjava/eroforrasok"
    chmod -R g=u "${pkgdir}/usr/share/abevjava/nyomtatvanyok"
    chmod -R g=u "${pkgdir}/usr/share/abevjava/upgrade"
    chmod -R g=u "${pkgdir}/usr/share/abevjava/segitseg"
    
    install=anyk.install
}
