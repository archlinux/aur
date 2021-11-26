makepkg:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	$(RM) ./pidcat-git-*.pkg.tar.zst
	$(RM) -rf ./pidcat/
	$(RM) -rf ./pkg/
	$(RM) -rf ./src/

.PHONY: clean makepkg
