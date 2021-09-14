clean:
	rm -rf src pkg
clean-all: clean
	rm -f *.diff
	rm -f *.tar.*
config:
	makepkg --nobuild
	cp -f src/st-0.8.4/config.def.h config.h
install: config.h
	makepkg -fis
