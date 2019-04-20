pkgname=guymager-svn
pkgver=0.8.8.r42
pkgrel=1
pkgdesc='A forensic imager for media acquisition, with user-friendly Qt interface.'
url='https://guymager.sourceforge.io/'
license=('GPL')
depends=('qt5-base' 'zlib' 'hdparm' 'udisks2' 'libewf' 'smartmontools' 'parted' 'polkit' 'libguytools' 'libbfio' 'openssl')
provides=('guymager')
conflicts=('guymager')
arch=('x86_64' 'i686')
source=($pkgname::"svn+https://svn.code.sf.net/p/guymager/code/"
        "https://mirrors.kernel.org/debian/pool/main/g/guymager/guymager_0.8.8-3.debian.tar.xz")
sha512sums=('SKIP'
            '89b42743ff86192ad102a41c1b539d6868beb63954d38b1a450c9e0b77000c61d35a9678be1651be2872b172e9b85711f400407e8fccfd5c152bb54820a8442d')

pkgver() {
	cd "$srcdir/$pkgname"

	local rev="$(svnversion)"
	printf "%s.r%s" "${pkgver%%.r*}" "${rev//[[:alpha:]]}"
}

prepare() {
	## import gcc8 patch from debian folks
	cd "$srcdir/$pkgname/tags/guymager-${pkgver%%.r*}"
	patch -p1 -i "$srcdir/debian/patches/gcc8_support.patch"

	## 1: dynamically linking
	## 2: typo
	## 3: link against openssl
	## 4: fix polkit policy naming
	{
		cat <<EOF
--- a/guymager.pro	2019-04-14 21:27:12.235944736 +0800
+++ b/guymager.pro	2019-04-14 21:27:20.499196599 +0800
@@ -172,7 +172,7 @@
 }
 
 
-STATIC = yes
+STATIC = no
 equals(STATIC, "yes") {
    LIBS += /usr/lib/libguytools.a
 
@@ -197,7 +197,7 @@
 }
 else {
    LIBS += -lguytools
-   contains (USE_LIBEWF 1) {
+   contains (USE_LIBEWF, 1) {
       LIBS += -lewf
       LIBS += -lbfio
    } 
@@ -208,8 +208,8 @@
 }
 
 # You may use any of the 3 following lines for the libssl hash functions
-#LIBS += -lssl     # See also macro definitions in common.h
-#LIBS += -lcrypto  # See also macro definitions in common.h
+LIBS += -lssl     # See also macro definitions in common.h
+LIBS += -lcrypto  # See also macro definitions in common.h
 #LIBS += /usr/lib/libcrypto.a
 
 TRANSLATIONS  = guymager_en.ts
--- a/org.freedesktop.guymager.policy	2019-04-14 21:13:31.784941183 +0800
+++ b/org.guymager.policy	2019-04-14 22:07:02.195336349 +0800
@@ -5,7 +5,7 @@
 <policyconfig>
    <vendor>Guymager</vendor>
    <vendor_url>http://guymager.sourceforge.net</vendor_url>
-   <action id="org.freedesktop.policykit.pkexec.guymager">
+   <action id="org.guymager">
    <description>Run Guymager with root rights</description>
    <message>Run Guymager with root rights</message>
    <defaults>
EOF
	} | patch -p1

	mv org{.freedesktop,}.guymager.policy

	qmake DEFINES+="ENABLE_LIBEWF=1" guymager.pro
}

build() {
	cd "$srcdir/$pkgname/tags/guymager-${pkgver%%.r*}"
	make
	lrelease guymager.pro

	cd manuals
	./rebuild.sh
}

package() {
	cd "$srcdir/$pkgname/tags/guymager-${pkgver%%.r*}"
	install -dm755 "$pkgdir"/usr/{bin,share/{guymager,man/man1,applications,pixmaps,polkit-1/actions}} "$pkgdir"/etc/guymager "$pkgdir"/usr/share/doc/guymager

	## binary
	install -m755 guymager{,-pkexec} "$pkgdir"/usr/bin
	## resource
	cp splash.png guymager_*.qm "$pkgdir"/usr/share/guymager
	## polkit
	cp org.guymager.policy "$pkgdir"/usr/share/polkit-1/actions
	## config file
	cp guymager.cfg "$pkgdir"/etc/guymager
	## icon
	cp guymager_128.{png,xpm} "$pkgdir"/usr/share/pixmaps
	## xdg desktop entry
	cp guymager.desktop "$pkgdir"/usr/share/applications
	## man
	cp manuals/guymager{,-pkexec}.1 "$pkgdir"/usr/share/man/man1
	## ref
	cp guymager_runstats_{active,ended}.template CREDITS debian/changelog "$pkgdir"/usr/share/doc/guymager
}
