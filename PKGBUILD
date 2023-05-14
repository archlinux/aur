# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_majorver=11
_completever=11.0.19
_updatever=7
_jdkver="$_completever.u$_updatever"

_buildver=1

pkgname=jdk11-microsoft-openjdk
pkgver="${_jdkver}.b${_buildver}"
pkgrel=1
pkgdesc='Microsoft Build of OpenJDK 11'
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
install=install_jdk11-microsoft-openjdk.sh
source=("https://aka.ms/download-jdk/microsoft-jdk-$_completever-linux-x64.tar.gz"
        freedesktop-java.desktop
				freedesktop-jconsole.desktop
				freedesktop-jshell.desktop)
sha256sums=('f4780a350756cfb464fa19c8865c574a00a196808b32f85722d02ab08e1a0b7d'
            '30724948d6cf565285c2e6f16a83d29714e84614fb7c3e862bb45a0ca05dba28'
            '8ef0d8051bfb52283e8e33bd13770d7ed1d06ed9543a2e7d1d36f76aad22937c'
            '0ae3257e9fea03416a169d94119ca3374a072bd8e430fdd3fa074f254a67b586')

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
