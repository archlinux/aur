# Maintainer: Stefan Swerk <stefan_aur@swerk.priv.at>
pkgname=rubanetra
pkgver=0.0.6
pkgrel=2
pkgdesc="A rule-based network traffic analysis Java framework."
arch=('any')
url="https://gitea.swerk.priv.at/stefan/rubanetra.git"
license=('GPL3')
groups=()
depends=('jdk8-openjdk'
         'libpcap')
makedepends=('maven')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/rubanetra/rubanetra.conf'
        'etc/rubanetra/logback.xml'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/00.Basic.Metadata.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/01.Basic.Output.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/02.Basic.Http.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/03.Basic.Tls.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/04.Derived.Https.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/05.Basic.Icmp.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/06.Application.OpenSSH.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/07.Application.Dropbox.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/08.Application.SpiderOak.drl'
        'etc/rubanetra/DefaultKnowledgeBase/at.jku.fim.rubanetra.drools.rules/09.Application.Skype.drl'
        )
options=()
changelog=
source=("https://gitea.swerk.priv.at/stefan/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.usr.install.patch")
noextract=()
sha256sums=('7eefa18258c9800203639b6c16b1715e2db416af2629c9c2cd76a2642ffd1ff4'
            'e588ef2d33c32055927f106b5cc7320eaf8fc502228f572450519feb6d768000')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.usr.install.patch"
}

build() {
	cd "$pkgname"
	MAVEN_OPTS=-Xmx128m mvn package
    mkdir -p "./tmp"
    unzip -o -d "./tmp" "./target/rubanetra-0.0.6-distribution.zip"
}


package() {
    mv "$srcdir/$pkgname-$pkgver/tmp" "$pkgdir/tmp"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/bin"

    install -d -m755 "$pkgdir/usr/share/rubanetra/lib"
    install -d -m755 "$pkgdir/etc/rubanetra"
    install -d -m777 "$pkgdir/var/log/rubanetra"

    cd "$pkgdir/tmp/$pkgname-$pkgver-distribution"
    install -D -m755 "rubanetra-0.0.6.jar" "$pkgdir/usr/share/rubanetra/rubanetra-0.0.6.jar"
    install -D -m644 rubanetra-0.0.6-{javadoc,sources,test-sources}.jar "$pkgdir/usr/share/rubanetra/"
    install -D -m644 README.* LICENSE.txt THIRD-PARTY.txt "$pkgdir/usr/share/rubanetra/"
    cd conf && find -type f \( -name "*.conf" -o -name "*.xml" -o -name "*.drl" -o -name "*.properties" \) -exec install -D -m644 '{}' "$pkgdir/etc/rubanetra/"'{}' ';' ; cd ..
    install -D -m644 lib/*.jar "$pkgdir/usr/share/rubanetra/lib/"
    
    if [ ${CARCH} = "x86_64" ] ; then
    	install -m644 lib/libjnetpcap/native/linux/amd64/* "$pkgdir/usr/lib/"
    else 
    	install -m644 lib/libjnetpcap/native/linux/i386/* "$pkgdir/usr/lib/"
    fi
    
    cd ../.. ; rm -r ./tmp
    
    sh -c "echo \"#!/bin/sh\" > $pkgdir/usr/bin/rubanetra"
    sh -c "echo \"exec /usr/bin/java -Xmx512m -jar '/usr/share/rubanetra/rubanetra-0.0.6.jar' \\\"\\\$@\\\"\" >> $pkgdir/usr/bin/rubanetra"
    chmod +x "$pkgdir/usr/bin/rubanetra"
}
