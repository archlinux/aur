USER = hackathon-2022-ticli
REPO = ticli
PKGDESC = A modern cli for tikv.
PKGVER = 0.1.0
PKGREL = 1

MAINTAINER = $(shell git config user.name) <$(shell git config user.email)>
PKGNAME = $(REPO)
BINNAME = $(REPO)
CONFLICTS = ("$(REPO)-git" "$(REPO)-bin")
PROVIDES = ()

.PHONY: codegen
codegen:
	@sed \
		-e 's#{{USER}}#$(USER)#g' \
		-e 's#{{REPO}}#$(REPO)#g' \
		-e 's#{{MAINTAINER}}#$(MAINTAINER)#g' \
		-e 's#{{PKGNAME}}#$(PKGNAME)#g' \
		-e 's#{{BINNAME}}#$(BINNAME)#g' \
		-e 's#{{PKGDESC}}#$(PKGDESC)#g' \
		-e 's#{{PKGVER}}#$(PKGVER)#g' \
		-e 's#{{PKGREL}}#$(PKGREL)#g' \
		-e 's#{{CONFLICTS}}#$(CONFLICTS)#g' \
		-e 's#{{PROVIDES}}#$(PROVIDES)#g' \
		PKGBUILD.tmpl > PKGBUILD
	@sed -i "s/{{MD5SUM}}/$$(makepkg -g | grep -Po '[0-9a-f]{32}')/g" PKGBUILD
	@makepkg --printsrcinfo > .SRCINFO

package: codegen
	@makepkg -f
