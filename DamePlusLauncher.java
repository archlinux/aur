import javax.swing.SwingUtilities;

public class DamePlusLauncher {
  public static void main(final String[] args) throws Exception {
    SwingUtilities.invokeAndWait(() -> {
      try {
        CStartklasse.main(args);
      } catch (Exception e) {
        throw new RuntimeException(e);
      }
    });
  }
}
