.PHONY: update_version push

package: .SRCINFO
	makepkg -f

.SRCINFO: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

# expects NEW_VERSION environment variable to be set to the new version (e.g. NEW_VERSION=1.2.6)
update_version:
	perl -i.back -pE 's/$$1/$$ENV{NEW_VERSION}/ if /pkgver=(\d+\.\d+\.\d+)/' PKGBUILD

push: .SRCINFO
	git add PKGBUILD .SRCINFO
	git commit -m "Update to $$NEW_VERSION"
	git push
