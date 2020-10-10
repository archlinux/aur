

build:
	makepkg -s
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -r pkg || echo "already clean?"
	rm -rf src || echo "already clean?"
	rm -rf python-ctc-segmentation-git || echo "already clean?"
	rm python-ctc-segmentation-git-*.tar.xz || echo "already clean?"

upload:
	git remote -v
	git push origin master
  
