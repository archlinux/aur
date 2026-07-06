TMP_PATH=~/.cache/yuh/aur/python-symfc

test:
	# rm -r ${TMP_PATH}
	mkdir -p ${TMP_PATH}
	cp PKGBUILD ${TMP_PATH}
	cd ${TMP_PATH} && makepkg -sfi
	cp ${TMP_PATH}/*.pkg.tar.zst ./

md5:
	sha256sum ${TMP_PATH}/*.zip

release:
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "update: 1.7.3"
	git push

.PHONY: test
