# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=1.11
sha256sums=('00bfc970d5c038c1e68bc356c6aa6f9a12995914b7d4fda69897622cb5b77ab8')

pkgname=rig
pkgdesc='Random Identity Generator'
arch=('any')
url='http://rig.sourceforge.net/'
license=('GPL')
source=("https://sourceforge.net/projects/rig/files/rig/1.11/rig-1.11.tar.gz")

PATCH1="$(cat <<'EOF'
diff --git a/Makefile b/Makefile
index 3c143bb..c6d5cf9 100644
--- a/Makefile
+++ b/Makefile
@@ -11,6 +11,8 @@ rig.6: rig.6.in
 	sed s@DATADIR@"$(DATADIR)"@g < rig.6.in > rig.6
 
 install: rig rig.6
+	mkdir -p $(BINDIR)
+	mkdir -p $(MANDIR)/man6
 	install -g 0 -m 755 -o 0 -s rig $(BINDIR)
 	install -g 0 -m 644 -o 0 rig.6 $(MANDIR)/man6/rig.6
 	install -g 0 -m 755 -o 0 -d $(DATADIR)
diff --git a/rig.cc b/rig.cc
index 1f9a2e4..b589913 100644
--- a/rig.cc
+++ b/rig.cc
@@ -21,6 +21,7 @@
 #include <fstream>
 #include <vector>
 #include <string>
+#include <cstring>
 #include <stdlib.h>
 #include <unistd.h>
 #include <time.h>
EOF
)"

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch --forward --strip=1 -p1 <<< "$PATCH1"
	make PREFIX=/usr
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install PREFIX=$pkgdir/usr
}
