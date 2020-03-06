clean:
	rm -f *.pkg.tar.xz
	rm -rf pkg/ src/
install:
	install -Dm777 ${srcdir}/haur ${pkgdir}/usr/bin/haur
	install -Dm644 ${srcdir}/haurrc ${pkgdir}/etc/haurrc
test:
	bash test.sh
