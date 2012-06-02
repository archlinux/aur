# Contributor: Prurigro
# Maintainer: Prurigro
pkgname=gdatafs
pkgver=1.0.2
pkgrel=1
pkgdesc="Gdatafs is a FUSE implemtation that mount picassa web and youtube to your filesystem"
url="http://gdatafs.sourceforge.net"
license="GPL"
depends=('fuse' 'java-runtime')
source=(http://sourceforge.net/projects/gdatafs/files/gdatafs%20$pkgver.tar.gz)
md5sums=('77e5207f1b2cfb72307087ebceb7b801')
arch=('i686' 'x86_64')
build() {
	pushd "$srcdir"/gdatafs || return 1
		find . -type f | sed -e 's/\.\///g' | while read file; do
			if [ $(echo "$file" | grep ".svn" -i -c) = 0 -a $(echo "$file" | grep ".project" -i -c) = 0 -a $(echo "$file" | grep ".classpath" -i -c) = 0 -a $(echo "$file" | grep "src" -i -c) = 0 ]; then
				install -D "$file" "$pkgdir"/opt/gdatafs/"$file" || return 1
			fi || return 1
		done || return 1
		install -d "$pkgdir"/usr/bin || return 1
		echo -e "#! /bin/sh\n\npushd /opt/gdatafs > /dev/null\n\t/opt/gdatafs/gdatafs \"\$1\" \"\$2\" \"\$3\"\npopd > /dev/null" > "$pkgdir"/usr/bin/gdatafs || return 1
		chmod 755 "$pkgdir"/usr/bin/gdatafs || return 1
	popd || return 1
}
