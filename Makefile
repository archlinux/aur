TMP_PATH=~/.cache/yuh/aur/hplip-lite

test:
	# rm -rf ${TMP_PATH}
	mkdir -p ${TMP_PATH}
	cp PKGBUILD ${TMP_PATH}
	cp *.patch ${TMP_PATH}
	cd ${TMP_PATH} && makepkg -sf
	cp ${TMP_PATH}/*.pkg.tar.zst ./

md5:
	sha256sum ${TMP_PATH}/*.gz

release:
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "update: 3.26.4"
	git push

