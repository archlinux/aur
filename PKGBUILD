# Maintainer: Brad Fanella <cesura@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Musikolo <musikolo@hotmail.com>
# Contributor: Ruben Fonseca <fonseka@gmail.com>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=groovy3
pkgver=3.0.7
pkgrel=1
pkgdesc='Programming language based on Java, inspired by Python, Ruby and Smalltalk - testing installation of Groovy 3.x'
arch=('any')
url='http://groovy-lang.org/'
license=('Apache')
conflicts=('groovy')
provides=('groovy')
depends=('bash' 'java-environment')
optdepends=('groovy-docs: html and pdf documentation for Groovy')
makedepends=('gendesk')
# .asc file is available for download, but there was no key available
source=("https://dl.bintray.com/groovy/maven/apache-groovy-binary-$pkgver.zip")
sha256sums=('b9e2041cb83a963922f6761a0b037c5784670616632142b8d7002b7c3a96b7f5')

prepare() {
	# Generate desktop shortcut
  	gendesk -f -n \
    		--pkgname "$pkgname" \
    		--pkgdesc 'Groovy programming language' \
    		--exec 'groovyConsole' \
    		--name 'Groovy Console'

  	# Patch the scripts
  	for f in "groovy-$pkgver/bin/"*; do
    		sed 's:bin/env\ sh:bin/env\ sh\nGROOVY_HOME=/usr/share/groovy\nexport _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=gasp $_JAVA_OPTIONS":' -i "$f"
  	done
}

package() {
  	cd "groovy-$pkgver"

  	# Create the directories and package the files
  	install -d "$pkgdir/usr/share/groovy" "$pkgdir/usr/bin"
  	cp -r lib conf "$pkgdir/usr/share/groovy"
  	cp bin/* "$pkgdir/usr/bin"
  	rm "$pkgdir"/usr/bin/*completion
  	install -Dm644 bin/*completion -t "$pkgdir"/usr/share/bash-completion/completions

  	# Remove all DOS/Windows batch files
  	find "$pkgdir" -name '*.bat' -exec rm {} \;

  	# Package the license file
  	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  	# Package the desktop shortcut for Groovy Console
  	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir"/usr/share/applications
}
