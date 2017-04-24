PREFIX =? /usr

all:
	@echo "You can run Anki with ./runanki"
	@echo "If you wish to install it system wide, type 'sudo make install'"
	@echo "Uninstall with 'sudo make uninstall'"

install:
	install -Dm755 tools/runanki.system ${DESTDIR}${PREFIX}/bin/anki
	install -Dm644 anki.xpm anki.png -t ${DESTDIR}${PREFIX}/share/pixmaps/
	install -Dm644 anki.desktop -t ${DESTDIR}${PREFIX}/share/applications/
	install -Dm644 anki.1 -t ${DESTDIR}${PREFIX}/share/man/man1/
	rm -rf ${DESTDIR}${PREFIX}/share/anki
	mkdir -p ${DESTDIR}${PREFIX}/share/anki
	cp -av * ${DESTDIR}${PREFIX}/share/anki/
	xdg-mime install anki.xml --novendor
	xdg-mime default anki.desktop application/x-anki
	xdg-mime default anki.desktop application/x-apkg
	@echo
	@echo "Install complete."

uninstall:
	rm -rf ${DESTDIR}${PREFIX}/share/anki
	rm -rf ${DESTDIR}${PREFIX}/bin/anki
	rm -rf ${DESTDIR}${PREFIX}/share/pixmaps/anki.xpm
	rm -rf ${DESTDIR}${PREFIX}/share/pixmaps/anki.png
	rm -rf ${DESTDIR}${PREFIX}/share/applications/anki.desktop
	rm -rf ${DESTDIR}${PREFIX}/share/man/man1/anki.1
	-xdg-mime uninstall ${DESTDIR}${PREFIX}/share/mime/packages/anki.xml
	@echo
	@echo "Uninstall complete."
