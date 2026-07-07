TMP_PATH=~/.cache/yuh/aur/python-phono3py

test:
# 	rm -rf ${TMP_PATH}
	mkdir -p ${TMP_PATH}
	cp PKGBUILD ${TMP_PATH}
	cp lammps.patch ${TMP_PATH}
	cd ${TMP_PATH} && makepkg -sfi
	cp ${TMP_PATH}/*.pkg.tar.zst ./

md5:
	sha256sum ${TMP_PATH}/*.gz

release:
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "fix: scikit-build-core<0.10"
	git push

.PHONY: test
