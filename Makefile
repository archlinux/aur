.PHONY: clean release
# prevent make from auto guessing and using implicit rules
.SUFFIXES:

release: clean
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf src limnoria-*
