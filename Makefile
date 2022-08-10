release: clean build commit publish

clean:
	rm -rf kickoff* pkg src

build:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

commit:
	PKGVER=$$(grep -oP '(?<=pkgver\=)[\d\w\.]+' PKGBUILD)
	git add PKGBUILD .SRCINFO
	git commit -m "bump version: $(PKGVER)"

publish: 
	git push
