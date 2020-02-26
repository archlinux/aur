clean:
	rm -f *.pkg.tar.xz
	rm -rf pkg/ src/
install:
	install -Dm777 ${srcdir}/haur ${pkgdir}/usr/bin/haur
test:
	bash test.sh
