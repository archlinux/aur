# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_majorver=16
_completever=16.0.2
_updatever=7
_jdkver="$_completever.u$_updatever"

_buildver=1

pkgname=jdk16-microsoft-openjdk
pkgver="${_jdkver}.b${_buildver}"
pkgrel=1
pkgdesc='Microsoft Build of OpenJDK 16'
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
install=install_jdk16-microsoft-openjdk.sh
source=("https://aka.ms/download-jdk/microsoft-jdk-${_jdkver/\.u/.}.$_buildver-linux-x64.tar.gz"
        freedesktop-java.desktop
				freedesktop-jconsole.desktop
				freedesktop-jshell.desktop)
sha256sums=('77c0a8fa9c326003200e96bd09ca0efda483fd4cc2fbb8b3c8a73ea4bdcf8d55'
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
