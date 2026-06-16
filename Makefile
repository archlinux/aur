.PHONY: clean commit upload

repo = https://github.com/hacs/integration
git_dir = src.git

commit: .SRCINFO
	git diff --exit-code > /dev/null || git commit -am "v$(shell cat version)"

version: export GIT_DIR=$(git_dir)
version: FORCE | $(git_dir)
	git fetch
	$(eval version := $(shell git describe --tags | cut -d- -f1))
	[ "$(shell cat version 2>/dev/null)" == "$(version)" ] || echo $(version) > $@

$(git_dir):
	git clone --bare $(repo) $@

FORCE:
	

PKGBUILD: version

.SRCINFO: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > $@

%: %.in
	m4 $< > $*

upload: commit
	git push

clean:
	rm -f .SRCINFO PKGBUILD version *.xz *.zip
	rm -Rf src.git/ src/
