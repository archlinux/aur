assets:
	tar cf files.tar.gz README.md steam.service steam-de

checksum:
	sha256sum files.tar.gz

clean:
	rm files.tar.gz
	rm -rf src/ pkg/
	rm steam-standalone-*.pkg.tar.xz
