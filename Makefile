snd-emu10k1-y := emu10k1.o emu10k1_main.o emufx.o emupcm.o emumixer.o emumpu401.o emuproc.o memory.o io.o irq.o p16v.o timer.o voice.o
obj-m += snd-emu10k1.o
ccflags-y := -I$(src) -include $(src)/emu10k1.h
