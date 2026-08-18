TMP_PATH=/home/yuh/.cache/yuh/aur/lammps-git

test:
	# rm -r ${TMP_PATH}
	rm -f ${TMP_PATH}/*.pkg.tar.zst
	mkdir -p ${TMP_PATH}
	cp PKGBUILD ${TMP_PATH}
	cd ${TMP_PATH} && makepkg -sf
	cp ${TMP_PATH}/*.pkg.tar.zst ./
	cp ${TMP_PATH}/PKGBUILD ./

md5:
	sha256sum ${TMP_PATH}/*.gz

release:
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "fix: patch_4Jul2026.r770.g4db85d8"
	git push

