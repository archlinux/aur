# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_majorver=21
_minorver=0
_pointver=0
_buildver=0
_linkver=$_majorver.$_minorver.$_pointver
_completever=$_linkver.$_buildver
_updatever=35
_jdkver=$_completever.u$_updatever

pkgname=jdk-microsoft-openjdk
pkgver="${_jdkver}"
pkgrel=2
pkgdesc='Microsoft Build of OpenJDK'
arch=(x86_64)
url=https://www.microsoft.com/openjdk
license=(custom)
depends=('java-runtime-common>=3' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')
optdepends=('gtk2: for the Gtk+ 2 look and feel'
            'gtk3: for the Gtk+ 3 look and fell')
provides=("java-runtime-headless=$_majorver"
          "java-runtime-headless-openjdk=$_majorver"
          "jre$_majorver-openjdk-headless=$_jdkver"
          "jre-openjdk-headless=$_jdkver"
          "java-runtime=$_majorver"
          "java-runtime-openjdk=$_majorver"
          "jre$_majorver-openjdk=$_jdkver"
          "jre-openjdk=$_jdkver"
          "java-environment=$_majorver"
          "java-environment-openjdk=$_majorver"
          "jdk$_majorver-openjdk=$_jdkver"
          "jdk-openjdk=$_jdkver"
          "openjdk$_majorver-src=$_jdkver"
          "openjdk-src=$_jdkver")
install=install_jdk-microsoft-openjdk.sh
source=("https://aka.ms/download-jdk/microsoft-jdk-$_linkver-linux-x64.tar.gz"
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
noextract=("microsoft-jdk-$_linkver-linux-x64.tar.gz")
sha256sums=('01ebc38576660b61cc45fdadb7f1cc59278d0284ef999c98ed8bc55c8946cbf4'
            '3d8e6e986650aa7436a2f0993c0edf7c4f664c5272256df2f34a46a64a0f60c6'
            'd6cc1229daeff37089c47e06e10adc9b90911761c0e4bd803cb1ecf34fd0603d'
            '4471cb02e32ddff54e65618e94acc66e06ab01e456d5daa3207a943155750db6')

_jvmdir="/usr/lib/jvm/java-$_majorver-microsoft-openjdk"

prepare() {
	mkdir jdk
	bsdtar --strip-components=1 -C jdk -xf "microsoft-jdk-$_linkver-linux-x64.tar.gz"
}

package() {
	cd jdk

	# Copy jdk files
	install -d "$pkgdir$_jvmdir"
	cp -a bin include jmods lib release "$pkgdir$_jvmdir"

	# Link JKS keystore from ca-certificates-utils
	rm -f "$pkgdir$_jvmdir/lib/security/cacerts"
	ln -s /etc/ssl/certs/java/cacerts "$pkgdir$_jvmdir/lib/security/cacerts"

	# Legal
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	cp -a legal "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "/usr/share/licenses/$pkgname" "$pkgdir$_jvmdir/legal"

	# Conf
	install -d "$pkgdir/etc"
	cp -r conf "$pkgdir/etc/$pkgname"
	ln -s "/etc/$pkgname" "$pkgdir$_jvmdir/conf"

	# Man pages
	for f in man/man1/*; do
		install -Dm644 \
			"$f" \
			"$pkgdir/usr/share/${f/\.1/-openjdk$_majorver-microsoft-openjdk.1}"
	done
	ln -s /usr/share/man "$pkgdir$_jvmdir/man"

	# Desktop files
	for f in jconsole java jshell; do
		install -Dm644 \
			"$srcdir/freedesktop-$f.desktop" \
			"$pkgdir/usr/share/applications/$f-$pkgname.desktop"
	done
}
