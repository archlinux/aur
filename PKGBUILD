# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_majorver=17
_completever=17.0.4
_updatever=8
_jdkver="$_completever.u$_updatever"

pkgname=jdk-microsoft-openjdk
pkgver="${_jdkver}"
pkgrel=1
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
source=("https://aka.ms/download-jdk/microsoft-jdk-$_completever-linux-x64.tar.gz"
        freedesktop-java.desktop
				freedesktop-jconsole.desktop
				freedesktop-jshell.desktop)
sha256sums=('e77bbbb76e49438f9b4ad5ca89f1184d260108797bd2461a8d98a1dd8ea16956'
            '7ed68488d8178733a23d4f009977ee6d3bebcdca3ed074fb6d0be6039c451d7d'
            '67c0102694dbfdc1141c6cbc2fa1a7153cbfa81f596744860d7c801a6b1df844'
            '424ee7a00116757a819b62bd670d583eea90e0ebee4a679f54b71980dbb28597')

_jvmdir="/usr/lib/jvm/java-$_majorver-microsoft-openjdk"

package() {
	cd "jdk-${_jdkver/\.u/+}"

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
