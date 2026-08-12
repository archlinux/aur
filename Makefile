TMP_PATH=/home/yuh/.cache/tmp_aur/ikuuu-vpn

test:
	# rm -r ${TMP_PATH}
	rm -f ${TMP_PATH}/*.pkg.tar.zst
	mkdir -p ${TMP_PATH}
	cp PKGBUILD ${TMP_PATH}
	cd ${TMP_PATH} && makepkg -sfi
	cp ${TMP_PATH}/*.pkg.tar.zst ./

md5:
	sha256sum ${TMP_PATH}/*.deb

release:
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "update: 0.17.5"
	git push
